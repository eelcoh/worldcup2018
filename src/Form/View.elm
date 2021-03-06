module Form.View exposing (view)

import Form.Types exposing (..)
import Form.Info
import Form.Submit
import Form.Question
import Form.Questions.Types as QT
import Form.QuestionSet
import Form.QuestionSets.Types as QTS
import Element
import Element.Attributes exposing (padding, spacing, paddingXY)
import UI.Style
import UI.Button
import Html exposing (Html)


-- View


view : Model Msg -> Html Msg
view model =
    let
        getCard =
            List.drop model.idx model.cards
                |> List.head

        makeCard mCard =
            case mCard of
                Just card ->
                    viewCard model model.idx card

                Nothing ->
                    Element.empty

        card =
            getCard
                |> makeCard
    in
        viewCardChrome model card model.idx
            |> Element.layout UI.Style.stylesheet


viewCard : Model Msg -> Int -> Card -> Element.Element UI.Style.Style variation Msg
viewCard model i card =
    case card of
        IntroCard intro ->
            Element.map InfoMsg (Form.Info.view intro)

        QuestionCard qModel ->
            Element.map (Answered i) (Form.Question.view model.bet qModel)

        QuestionSetCard qsModel ->
            Element.map (QuestionSetMsg i) (Form.QuestionSet.view qsModel model.bet)

        SubmitCard ->
            let
                isComplete card =
                    case card of
                        IntroCard _ ->
                            True

                        QuestionCard qModel ->
                            QT.isComplete model.bet qModel

                        QuestionSetCard qsModel ->
                            QTS.isComplete model.bet qsModel

                        SubmitCard ->
                            True

                submittable =
                    List.all isComplete model.cards
            in
                Element.map SubmitMsg (Form.Submit.view model.bet submittable model.submitted)


viewPill : Model Msg -> Int -> ( Int, Card ) -> Element.Element UI.Style.Style variation Msg
viewPill model idx ( i, card ) =
    let
        semantics =
            case card of
                IntroCard intro ->
                    UI.Style.Perhaps

                QuestionCard qModel ->
                    mkpillModel (QT.isComplete model.bet qModel) (i == idx)

                QuestionSetCard qsModel ->
                    mkpillModel (QTS.isComplete model.bet qsModel) (i == idx)

                SubmitCard ->
                    UI.Style.Perhaps

        mkpillModel complete current =
            case ( complete, current ) of
                ( True, True ) ->
                    UI.Style.Selected

                ( True, False ) ->
                    UI.Style.Active

                ( False, True ) ->
                    UI.Style.Right

                ( False, False ) ->
                    UI.Style.Wrong

        msg =
            NavigateTo i

        contents =
            case card of
                IntroCard intro ->
                    "Start"

                QuestionCard qModel ->
                    QT.display model.bet qModel

                QuestionSetCard model ->
                    QTS.display model

                SubmitCard ->
                    "Insturen"
    in
        UI.Button.pill semantics
            msg
            contents


viewCardChrome :
    Model Msg
    -> Element.Element UI.Style.Style variation Msg
    -> Int
    -> Element.Element UI.Style.Style variation Msg
viewCardChrome model card i =
    let
        next =
            Basics.min (i + 1) ((List.length model.cards) - 1)

        prev =
            Basics.max (i - 1) 0

        pills =
            List.map (viewPill model i) (List.indexedMap (,) model.cards)

        prevPill =
            UI.Button.pill UI.Style.Irrelevant (NavigateTo prev) "vorige"

        nextPill =
            UI.Button.pill UI.Style.Irrelevant (NavigateTo next) "volgende"

        pillsPlus =
            prevPill
                :: (List.append pills [ nextPill ])
                |> Element.wrappedRow UI.Style.None [ spacing 7, padding 0 ]
    in
        Element.column UI.Style.None
            [ spacing 20, paddingXY 70 20 ]
            [ pillsPlus
            , card
            ]
