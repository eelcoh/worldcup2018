module UI.Style exposing (..)

import Color exposing (..)
import Http exposing (post)
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Style.Scale as Scale
import Style.Shadow as Shadow


type Style
    = Button ButtonSemantics FontSize
    | MatchRow ButtonSemantics
    | Matches
    | ActiveMatch
    | TeamNameFull
    | Flag
    | FlagImage
    | TeamName
    | TeamBox
    | Score
    | ScoreRow
    | ScoreColumn
    | ScoreInput
    | Introduction
    | Header1
    | Page
    | Emphasis
    | Wrapper
    | GroupBadge
    | GroupPosition
    | GroupPositions
    | None
    | Bullet
    | TextInput
    | Link


type ButtonSemantics
    = Active
    | Inactive
    | Wrong
    | Right
    | Perhaps
    | Irrelevant
    | Potential
    | Selected


type FontSize
    = SmallFont
    | NormalFont
    | LargeFont



-- palette


grey : Color
grey =
    rgb 96 125 139


darkgrey : Color
darkgrey =
    rgb 80 77 78


goldengrey : Color
goldengrey =
    rgb 192 192 163


green : Color
green =
    rgb 183 235 52


browngrey : Color
browngrey =
    rgb 215 204 200


orange : Color
orange =
    rgb 230 74 25


blue : Color
blue =
    rgb 74 197 235


red : Color
red =
    rgb 236 38 85


black : Color
black =
    rgb 14 6 12


white : Color
white =
    rgb 254 252 255



-- semantics


active : Color
active =
    blue


selected : Color
selected =
    red


highlight : Color
highlight =
    green


emphasis : Color
emphasis =
    black


potential : Color
potential =
    goldengrey


light : Color
light =
    white


dark : Color
dark =
    black


buttonStyle semantics sz =
    let
        fontSize =
            case sz of
                SmallFont ->
                    Font.size 10

                NormalFont ->
                    Font.size 16

                LargeFont ->
                    Font.size 32

        ( fg, bg ) =
            case semantics of
                Active ->
                    ( dark, blue )

                Inactive ->
                    ( light, grey )

                Wrong ->
                    ( light, red )

                Right ->
                    ( light, green )

                Perhaps ->
                    ( light, black )

                Irrelevant ->
                    ( dark, light )

                Potential ->
                    ( light, goldengrey )

                Selected ->
                    ( light, red )
    in
        style (Button semantics sz)
            [ Color.background bg
            , Color.text fg
            , Font.center
            , Font.typeface
                [ Font.font "Inconsolata" ]
            , fontSize
            , hover
                [ cursor "pointer"
                , Shadow.glow bg 1
                ]
            ]


buttonStyles =
    let
        semantics =
            [ Active, Potential, Perhaps, Irrelevant, Wrong, Right, Selected, Inactive ]

        fontSizes =
            [ SmallFont, NormalFont, LargeFont ]

        mkButtonStyle sem =
            List.map (buttonStyle sem) fontSizes
    in
        List.concatMap mkButtonStyle semantics


btnStyle : Color -> Color -> Float -> List (Property class variation)
btnStyle fg bg sz =
    [ Color.background bg
    , Color.text fg
    , Font.center
    , Font.typeface
        [ Font.font "Inconsolata" ]
    , Font.size sz
    , hover
        [ cursor "pointer"
        , Shadow.glow bg 1
        ]
    ]



-- rgb 0 150 136


scale : Int -> Float
scale =
    Scale.modular 16 1.618


stylesheet : StyleSheet Style variation
stylesheet =
    let
        basicStyles =
            [ style Header1
                [ Font.size (scale 2)
                , Color.text emphasis
                , Font.typeface
                    [ -- Font.font "medium-content-sans-serif-font"
                      Font.font "Lato"
                    ]
                ]
            , style Introduction
                [ Font.size (scale 1)
                , Font.lineHeight 2
                , Font.typeface
                    [ -- Font.font "medium-content-serif-font"
                      Font.font "Lora"
                    ]
                ]
            , style Page
                []
            , style Flag
                []
            , style FlagImage
                []
            , style TeamName
                [ Font.center
                ]
            , style TeamBox
                []
            , style ScoreRow
                []
            , style ScoreColumn
                []
            , style ScoreInput
                []
            , style Score
                [ Font.center
                ]
            , style Matches
                []
            , style ActiveMatch
                []
            , style (MatchRow Active)
                (btnStyle light active 16)
            , style (MatchRow Selected)
                (btnStyle light selected 16)
            , style (MatchRow Potential)
                (btnStyle light selected 16)
            , style TeamNameFull
                [ Font.size (scale 1)
                , Font.center
                ]
            , style TeamBox
                [ Color.background active
                , Color.text light
                , Font.size (scale 1)
                , Font.center
                ]
            , style Emphasis
                [ Color.text emphasis
                , Font.weight 700
                ]
            , style Wrapper
                []
            , style GroupBadge
                []
            , style GroupPosition
                []
            , style GroupPositions
                []
            , style None
                []
            , style Bullet
                [ Color.background active ]
            , style TextInput
                []
            , style Link
                [ Color.text active
                , hover [ cursor "pointer" ]
                ]
            ]
    in
        basicStyles
            ++ buttonStyles
            |> Style.styleSheet



--
