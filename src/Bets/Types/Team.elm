module Bets.Types.Team
    exposing
        ( team
        , display
        , displayFull
        , mdisplay
        , mdisplayFull
        , log
        , flag
        , flagUrl
        , initTeamData
        , isComplete
        , decode
        , encode
        , encodeMaybe
        )

import Html exposing (..)
import Html.Attributes exposing (style, src, class)
import Json.Encode
import Json.Decode exposing (Decoder, maybe)
import Maybe.Extra as M
import Bets.Types exposing (Team, TeamID, TeamData, TeamDatum, Group(..))


initTeamData : TeamData
initTeamData =
    [ -- group A
      russia
    , saoudiArabia
    , egypt
    , uruguay
      -- group B
    , portugal
    , spain
    , morocco
    , iran
      -- group C
    , france
    , australia
    , peru
    , denmark
      -- group D
    , argentina
    , iceland
    , croatia
    , nigeria
      -- group E
    , brazil
    , switzerland
    , costaRica
    , serbia
      -- group F
    , germany
    , mexico
    , sweden
    , southKorea
      -- group G
    , belgium
    , panama
    , tunisia
    , england
      -- group H
    , poland
    , senegal
    , colombia
    , japan
    ]


team : TeamID -> String -> Team
team teamID teamName =
    Team teamID teamName


display : Team -> String
display team =
    team.teamID


displayFull : Team -> String
displayFull team =
    team.teamName


mdisplayFull : Maybe Team -> String
mdisplayFull mteam =
    Maybe.map displayFull mteam
        |> Maybe.withDefault ""


mdisplay : Maybe Team -> String
mdisplay mteam =
    Maybe.map display mteam
        |> Maybe.withDefault ""


log : Team -> String
log team =
    team.teamName


flag : Maybe Team -> Html msg
flag mteam =
    let
        uri team =
            (flagUri 2) ++ team.teamID ++ ".png"

        default =
            team "xyz" ""
    in
        case mteam of
            Nothing ->
                img [ (src (uri default)) ] []

            Just t ->
                img [ (src (uri t)) ] []


flagUrl : Maybe Team -> String
flagUrl mteam =
    let
        uri team =
            (flagUri 2) ++ team.teamID ++ ".png"

        default =
            team "xyz" ""
    in
        case mteam of
            Nothing ->
                uri default

            Just t ->
                uri t


flagUri : Int -> String
flagUri size =
    if (size > 5) || (size < 0) then
        "http://img.fifa.com/images/flags/3/"
    else
        "http://img.fifa.com/images/flags/" ++ (toString size) ++ "/"


isComplete : Maybe Team -> Bool
isComplete mTeam =
    M.isJust mTeam


decode : Decoder Team
decode =
    Json.Decode.map2 Team
        (Json.Decode.field "teamID" Json.Decode.string)
        (Json.Decode.field "teamName" Json.Decode.string)


encodeMaybe : Maybe Team -> Json.Encode.Value
encodeMaybe mTeam =
    case mTeam of
        Just t ->
            encode t

        Nothing ->
            Json.Encode.null


encode : Team -> Json.Encode.Value
encode team =
    Json.Encode.object
        [ ( "teamID", Json.Encode.string team.teamID )
        , ( "teamName", Json.Encode.string team.teamName )
        ]



-- teams


russia : TeamDatum
russia =
    { team = (team "RUS" "Rusland")
    , players =
        [ "Soslan Dzhanaev"
        , "Igor Akinfeev"
        , "Vladimir Gabulov"
        , "Andrey Lyunev"
        , "Vladimir Granat"
        , "Ruslan Kambolov"
        , "Fyodor Kudryashov"
        , "Ilya Kutepov"
        , "Roman Neustädter"
        , "Konstantin Rausch"
        , "Igor Smolnikov,"
        , "Mario Fernandes"
        , "Andrei Semyonov"
        , "Yuri Gazinski"
        , "Aleksandr Golovin"
        , "Alan Dzagoev"
        , "Aleksandr Erokhin"
        , "Yuri Zhirkov"
        , "Daler Kuzyaev"
        , "Roman Zobnin"
        , "Aleksandr Samedov"
        , "Anton Miranchuk"
        , "Denis Cheryshev"
        , "Aleksandr Tashaev"
        , "Fyodor Chalov"
        , "Artem Dzyuba"
        , "Fyodor Smolov"
        , "Aleksei Miranchuk"
        ]
    , group = A
    }


egypt : TeamDatum
egypt =
    { team = { teamID = "EGY", teamName = "Egypte" }
    , players =
        [ "Essam El-Hadary"
        , "Mohamed El-Shennawi"
        , "Sherif Ekramy"
        , "Mohamed Awaad"
        , "Saad Samir"
        , "Ayman Ashraf"
        , "Ahmed Fathi"
        , "Ahmed Elmohamady"
        , "Omar Gaber"
        , "Mohamed Abdel-Shafi"
        , "Ahmed Hegazi"
        , "Ali Gabr"
        , "Karim Hafiz"
        , "Amro Tarek"
        , "Mahmoud 'El-Winsh' Hamdy"
        , "Shikabala"
        , "Abdallah El-Said"
        , "Mohamed Elneny"
        , "Mahmoud Abdel-Aziz"
        , "Tarek Hamed"
        , "Mahmoud Kahraba"
        , "Mahmoud 'Trezeguet' Hassan"
        , "Ramadan Sobhi"
        , "Sam Morsy"
        , "Amr Warda"
        , "Mohamed Salah"
        , "Marwan Mohsen"
        , "Ahmed Koka"
        , "Ahmed Gomaa"
        ]
    , group = A
    }


saoudiArabia : TeamDatum
saoudiArabia =
    { team = { teamID = "KSA", teamName = "Saoedi Arabië" }
    , players =
        [ "Assaf Al-Qarni"
        , "Mohammed Al-Owais"
        , "Yasser Al-Mosailem"
        , "Abdullah Al-Mayouf"
        , "Mansoor Al-Harbi"
        , "Saeed Al-Mowalad"
        , "Motaz Hawsawi"
        , "Yasir Al-Shahrani"
        , "Mohammed Al-Breik"
        , "Osama Hawsawi"
        , "Mohammed Jahfali"
        , "Ali Al-Bulaihi"
        , "Omar Hawsawi"
        , "Abdullah Al-Khaibari"
        , "Hattan Bahebri"
        , "Abdulmalek Al-Khaibri"
        , "Abdullah Otayf"
        , "Salman Al-Faraj"
        , "Nawaf Al-Abed"
        , "Mohamed Kanno"
        , "Taisir Al-Jassim"
        , "Hoessain Al-Mogahwi"
        , "Mohammed Al-Kwikbi"
        , "Salem Al-Dawsari"
        , "Yahya Al-Shehri"
        , "Fahad Al-Muwallad"
        , "Mohammad Al-Sahlawi"
        , "Muhannad Assiri"
        ]
    , group = A
    }


uruguay : TeamDatum
uruguay =
    { team = { teamID = "URU", teamName = "Uruguay" }
    , players =
        [ "Fernando Muslera"
        , "Martín Silva"
        , "Martín Campaña"
        , "Diego Godín"
        , "Sebastián Coates"
        , "José María Giménez"
        , "Maximiliano Pereira"
        , "Gastón Silva"
        , "Martín Cáceres"
        , "Guillerma Varela"
        , "Nahitan Nández"
        , "Lucas Torreira"
        , "Matías Vecino"
        , "Federico Valverde"
        , "Rodrigo Bentancur"
        , "Carlos Sánchez"
        , "Giorgian De Arrascaeta"
        , "Diego Laxalt"
        , "Cristian Rodríguez"
        , "Jonathan Urretaviscaya"
        , "Nicolás Lodeiro"
        , "Gastón Ramírez"
        , "Cristhian Stuani"
        , "Maximiliano Gómez"
        , "Edinson Cavani"
        , "Luis Suárez"
        ]
    , group = A
    }



-- group B


portugal : TeamDatum
portugal =
    { team = (team "POR" "Portugal")
    , players =
        [ "Anthony Lopes"
        , "Beto"
        , "Rui Patricio"
        , "Bruno Alves"
        , "Cédric Soares"
        , "José Fonte"
        , "Mário Rui"
        , "Pepe"
        , "Raphaël Guerreiro"
        , "Ricardo Pereira"
        , "Rúben Dias"
        , "Adrien Silva"
        , "Bruno Fernandes"
        , "William Carvalho"
        , "João Mario"
        , "João Moutinho"
        , "Manuel Fernandes"
        , "André Silva"
        , "Bernardo Silva"
        , "Cristiano Ronaldo"
        , "Gelson Martins"
        , "Gonçalo Guedes"
        , "Ricardo Quaresma"
        ]
    , group = B
    }


spain : TeamDatum
spain =
    { team = (team "ESP" "Spanje")
    , players =
        [ "David de Gea"
        , "Pepe Reina"
        , "Kepa Arrizabalaga"
        , "Jordi Alba"
        , "Nacho Monreal"
        , "Álvaro Odriozola"
        , "Nacho Fernandez"
        , "Dani Carvajal"
        , "Gerard Piqué"
        , "Sergio Ramos"
        , "Cesar Azpilicueta"
        , "Sergio Busquets"
        , "Isco"
        , "Thiago Alcántara"
        , "David Silva"
        , "Andrés Iniesta"
        , "Saúl Ñíguez"
        , "Koke"
        , "Marco Asensio"
        , "Iago Aspas"
        , "Diego Costa"
        , "Rodrigo Moreno"
        , "Lucas Vázquez"
        ]
    , group = B
    }


morocco : TeamDatum
morocco =
    { team = { teamID = "MAR", teamName = "Marokko" }
    , players =
        [ "Munir Mohand"
        , "Yassine Bounou"
        , "Ahmed Reda Tagnaouti"
        , "Nabil Dirar"
        , "Marouane Da Costa"
        , "Romain Saiss"
        , "Hamza Mendyl"
        , "Sofyan Amrabat"
        , "Medhi Benatia"
        , "Achraf Hakimi"
        , "Badr Banoun"
        , "Mbark Boussoufa"
        , "Karim El Ahmadi"
        , "Youssef Ait Bennasser"
        , "Younes Belhanda"
        , "Faycal Fajr"
        , "Amine Harit"
        , "Hakim Ziyech"
        , "Ayoub El Kaabi"
        , "Khalid Boutaib"
        , "Aziz Bouhaddouz"
        , "Nordin Amrabat"
        , "Mehdi Carcela-Gonzalez"
        ]
    , group = B
    }


iran : TeamDatum
iran =
    { team = { teamID = "IRN", teamName = "Iran" }
    , players =
        [ "Alireza Beiranvand"
        , "Rashid Mazaheri"
        , "Amir Abedzadeh"
        , "Ramin Rezaeian"
        , "Seyed Jalal Hosseini"
        , "Mohammad Reza Khanzadeh"
        , "Morteza Pouraliganji"
        , "Pejman Montazeri"
        , "Seyed Majid Hosseini"
        , "Milad Mohammadi"
        , "Roozbeh Cheshmi"
        , "Saeid Ezatolahi"
        , "Masoud Shojaei"
        , "Saman Ghoddos"
        , "Mehdi Torabi"
        , "Ashkan Dejagah"
        , "Omid Ebrahimi"
        , "Ali Gholizadeh"
        , "Vahid Amiri"
        , "Alireza Jahanbakhsh"
        , "Karim Ansarifard"
        , "Mahdi Taremi"
        , "Sardar Azmoun"
        , "Reza Ghoochannejhad"
        ]
    , group = B
    }



-- group C


france : TeamDatum
france =
    { team = { teamID = "FRA", teamName = "Frankrijk" }
    , players =
        [ "Hugo Lloris"
        , "Steve Mandanda"
        , "Alphonse Areola"
        , "Djibril Sidibé"
        , "Benjamin Pavard"
        , "Raphaël Varane"
        , "Presnel Kimpembe"
        , "Adil Rami"
        , "Samuel Umtiti"
        , "Lucas Hernández"
        , "Benjamin Mendy"
        , "Paul Pogba"
        , "N'Golo Kanté"
        , "Corentin Tolisso"
        , "Blaise Matuidi"
        , "Steven N’Zonzi"
        , "Thomas Lemar"
        , "Kylian Mbappé"
        , "Olivier Giroud"
        , "Antoine Griezmann"
        , "Ousmane Dembélé"
        , "Nabil Fékir"
        , "Florian Thauvin"
        ]
    , group = C
    }


australia : TeamDatum
australia =
    { team = { teamID = "AUS", teamName = "Australië" }
    , players =
        [ "Brad Jones"
        , "Mathew Ryan"
        , "Danny Vukovic"
        , "Mitchell Langerak"
        , "Aziz Behich"
        , "Milos Degenek"
        , "Alex Gersbach"
        , "Matthew Jurman"
        , "Fran Karacic"
        , "James Meredith"
        , "Joshua Risdon"
        , "Trent Sainsbury"
        , "Aleksandar Susnjar"
        , "Bailey Wright"
        , "Joshua Brillante"
        , "Jackson Irvine"
        , "Mile Jedinak"
        , "Robbie Kruse"
        , "Massimo Luongo"
        , "Mark Milligan"
        , "Aaron Mooy"
        , "Tom Rogic"
        , "James Troisi"
        , "Tim Cahill"
        , "Daniel Arzani"
        , "Apostolos Giannou"
        , "Nikita Rukavytsya"
        , "Tomi Juric"
        , "Mathew Leckie"
        , "Jamie Maclaren"
        , "Andrew Nabbout"
        , "Dimi Petratos"
        ]
    , group = C
    }


peru : TeamDatum
peru =
    { team = { teamID = "PER", teamName = "Peru" }
    , players =
        [ "Pedro Gallese"
        , "José Carvallo"
        , "Carlos Caceda"
        , "Luis Abram"
        , "Luis Advíncula"
        , "Miguel Araujo"
        , "Aldo Corzo"
        , "Nilson Loyola"
        , "Christian Ramos"
        , "Alberto Rodríguez"
        , "Anderson Santamaría"
        , "Miguel Trauco"
        , "Pedro Aquino"
        , "Wilmer Cartagena"
        , "Christian Cueva"
        , "Edison Flores"
        , "Paolo Hurtado"
        , "Sergio Peña"
        , "Andy Polo"
        , "Renato Tapia"
        , "Yoshimar Yotún"
        , "Paolo Guerrero"
        , "André Carrillo"
        , "Raul Ruidiaz"
        , "Jefferson Farfán"
        ]
    , group = C
    }


denmark : TeamDatum
denmark =
    { team = { teamID = "DEN", teamName = "Denemarken" }
    , players =
        [ "Kasper Schmeichel"
        , "Jonas Lössl"
        , "Frederik Rönnow"
        , "Jesper Hansen"
        , "Simon Kjaer"
        , "Andreas Christensen"
        , "Mathias 'Zanka' Jörgensen"
        , "Jannik Vestergaard"
        , "Andreas Bjelland"
        , "Henrik Dalsgaard"
        , "Peter Ankersen"
        , "Nicolai Boilesen"
        , "Jens Stryger"
        , "Riza Durmisi"
        , "Jonas Knudsen"
        , "William Kvist"
        , "Robert Skov"
        , "Thomas Delaney"
        , "Lukas Lerager"
        , "Lasse Schöne"
        , "Mike Jensen"
        , "Christian Eriksen"
        , "Daniel Wass"
        , "Pierre-Emile Höjbjerg"
        , "Mathias Jensen"
        , "Michael Krohn-Dehli"
        , "Pione Sisto"
        , "Martin Braithwaite"
        , "Andreas Cornelius"
        , "Viktor Fischer"
        , "Yussuf Poulsen"
        , "Nicolai Jörgensen"
        , "Nicklas Bendtner"
        , "Kasper Dolberg"
        , "Kenneth Zohore"
        ]
    , group = C
    }



-- group D


argentina : TeamDatum
argentina =
    { team = { teamID = "ARG", teamName = "Argentinë" }
    , players =
        [ "Sergio Romero"
        , "Willy Caballero"
        , "Franco Armani"
        , "Gabriel Mercado"
        , "Cristian Ansaldi"
        , "Nicolás Otamendi"
        , "Federico Fazio"
        , "Marcos Rojo"
        , "Nicolás Tagliafico"
        , "Marcos Acuña"
        , "Javier Mascherano"
        , "Eduardo Salvio"
        , "Lucas Biglia"
        , "Giovani Lo Celso"
        , "Ever Banega"
        , "Manuel Lanzini"
        , "Maximiliano Meza"
        , "Ángel Di María"
        , "Cristian Pavón"
        , "Lionel Messi"
        , "Paulo Dybala"
        , "Gonzalo Higuaín"
        , "Sergio Agüero"
        ]
    , group = D
    }


iceland : TeamDatum
iceland =
    { team = (team "ISL" "IJsland")
    , players =
        [ "Hannes Halldorsson"
        , "Runar Alex Runarsson"
        , "Frederik Schram"
        , "Kari Arnasson"
        , "Ari Freyr Skulason"
        , "Hördur Magnússon"
        , "Hólmar Örn Eyjolfsson"
        , "Sverrir Ingi Ingason"
        , "Ragnar Sigurdsson"
        , "Birkir Már Saevarsson"
        , "Samuel Fridjónsson"
        , "Johan Berg Gudmundsson"
        , "Arnor Ingvi Traustason"
        , "Aaron Gunnarsson"
        , "Olafur Ingi Skulason"
        , "Gylfi Sigurdsson"
        , "Emil Hallfredsson"
        , "Birkir Bjarnason"
        , "Rurik Gíslason"
        , "Björn Bergmann Sigurdsson"
        , "Alfred Finnbogason"
        , "Jon Dadi Bodvarsson"
        , "Albert Gudmundsson"
        ]
    , group = D
    }


croatia : TeamDatum
croatia =
    { team = (team "CRO" "Kroatië")
    , players =
        [ "Danijel Subasic"
        , "Lovre Kalinic"
        , "Dominik Livakovic"
        , "Vedran Corluka"
        , "Domagoj Vida"
        , "Ivan Strinic"
        , "Dejan Lovren"
        , "Sime Vrsaljko"
        , "Josip Pivaric"
        , "Tin Jedvaj"
        , "Matej Mitrovic"
        , "Duje Caleta-Car"
        , "Luka Modric"
        , "Mateo Kovacic"
        , "Ivan Rakitic"
        , "Milan Badelj"
        , "Marcelo Brozovic"
        , "Filip Bradaric"
        , "Mario Mandzukic"
        , "Ivan Perisic"
        , "Nikola Kalinic"
        , "Andrej Kramaric"
        , "Marko Pjaca"
        , "Ante Rebic"
        ]
    , group = D
    }


nigeria : TeamDatum
nigeria =
    { team = { teamID = "NGA", teamName = "Nigeria" }
    , players =
        [ "Ikechukwu Ezenwa"
        , "Daniel Akpeyi"
        , "Francis Uzoho,"
        , "Dele Ajiboye"
        , "William Troost-Ekong"
        , "Leon Balogun"
        , "Olaoluwa Aina"
        , "Kenneth Omeruo"
        , "Bryan Idowu"
        , "Chidozie Awaziem"
        , "Abdullahi Shehu"
        , "Elderson Echiejile"
        , "Tyronne Ebuehi"
        , "Stephen Eze"
        , "John Obi Mikel"
        , "Ogenyi Onazi"
        , "John Ogu"
        , "Wilfred Ndidi"
        , "Uche Agbo"
        , "Oghenekaro Etebo"
        , "Joel Obi"
        , "Mikel Agu"
        , "Odion Ighalo"
        , "Ahmed Musa"
        , "Victor Moses"
        , "Alex Iwobi"
        , "Kelechi Iheanacho"
        , "Moses Simon"
        , "Junior Lokosa"
        , "Simeon Nwankwo"
        ]
    , group = D
    }



-- group E


brazil : TeamDatum
brazil =
    { team = { teamID = "BRA", teamName = "Brazilië" }
    , players =
        [ "Alisson"
        , "Ederson"
        , "Cassio Ramos"
        , "Danilo"
        , "Fagner"
        , "Filipe Luis"
        , "Pedro Geromel"
        , "Marcelo"
        , "Marquinhos"
        , "Thiago Silva"
        , "Joao Miranda"
        , "Casemiro"
        , "Philippe Coutinho, Paulinho"
        , "Fernandinho"
        , "Fred"
        , "Renato Augusto"
        , "Willian"
        , "Douglas Costa"
        , "Roberto Firmino"
        , "Gabriel Jesus"
        , "Neymar"
        , "Taison"
        ]
    , group = E
    }


switzerland : TeamDatum
switzerland =
    { team = (team "SUI" "Zwitserland")
    , players =
        []
    , group = E
    }


costaRica : TeamDatum
costaRica =
    { team = { teamID = "CRC", teamName = "Costa Rica" }
    , players =
        [ "Keylor Navas"
        , "Patrick Pemberton"
        , "Leonel Moreira"
        , "Cristian Gamboa"
        , "Ian Smith"
        , "Ronald Matarrita"
        , "Bryan Oviedo"
        , "Oscar Duarte"
        , "Giancarlo Gonzalez"
        , "Francisco Calvo"
        , "Kendall Waston"
        , "Johnny Acosta"
        , "David Guzman"
        , "Yeltsin Tejeda"
        , "Celso Borges"
        , "Randall Azofeifa"
        , "Rodney Wallace"
        , "Bryan Ruiz"
        , "Daniel Colindres"
        , "Christian Bolanos"
        , "Johan Venegas"
        , "Joel Campbell"
        , "Marco Urena"
        ]
    , group = E
    }


serbia : TeamDatum
serbia =
    { team = { teamID = "SRB", teamName = "Servië" }
    , players =
        [ "Vladimir Stojkovic"
        , "Predrag Rajkovic"
        , "Marko Dmitrovic"
        , "Aleksandar Jovanovic"
        , "Branislav Ivanovic"
        , "Aleksandar Kolarov"
        , "Antonio Rukavina"
        , "Dusko Tosic"
        , "Milos Veljkovic"
        , "Uros Spajic"
        , "Nikola Milenkovic"
        , "Milan Rodić"
        , "Matija Nastasic"
        , "Nemanja Maksimovic"
        , "Dusan Tadic"
        , "Filip Kostic"
        , "Andrija Zivkovic"
        , "Nemanja Radonjic"
        , "Nemanja Matic"
        , "Luka Milivojevic"
        , "Sergej Milinkovic-Savic"
        , "Adem Ljajic"
        , "Mijat Gacinovic"
        , "Marko Grujic"
        , "Aleksandar Prijovic"
        , "Luka Jovic"
        , "Aleksandar Mitrovic"
        ]
    , group = E
    }



-- group F


germany : TeamDatum
germany =
    { team = (team "GER" "Duitsland")
    , players =
        [ "Manuel Neuer"
        , "Bernd Leno"
        , "Marc-André ter Stegen"
        , "Kevin Trapp"
        , "Mats Hummels"
        , "Joshua Kimmich"
        , "Niklas Süle"
        , "Jerome Boateng"
        , "Matthias Ginter"
        , "Jonas Hector"
        , "Marvin Plattenhardt"
        , "Antonio Rüdiger"
        , "Jonathan Tah"
        , "Sebastian Rudy"
        , "Thomas Müller"
        , "Leon Goretzka"
        , "Ilkay Gündogan"
        , "Sami Khedira"
        , "Toni Kroos"
        , "Mesut Özil"
        , "Marco Reus"
        , "Mario Gomez"
        , "Leroy Sané"
        , "Julian Draxler"
        , "Timo Werner"
        , "Julian Brandt"
        , "Nils Petersen"
        ]
    , group = F
    }


mexico : TeamDatum
mexico =
    { team = { teamID = "MEX", teamName = "Mexico" }
    , players =
        [ "Guillermo Ochoa"
        , "Alfredo Talavera"
        , "Jesus Corona"
        , "Carlos Salcedo"
        , "Nestor Araujo"
        , "Diego Reyes"
        , "Hector Moreno"
        , "Hugo Ayala"
        , "Oswaldo Alanis"
        , "Edson Alvarez"
        , "Jesus Gallardo"
        , "Miguel Layun"
        , "Jesus Molina"
        , "Rafa Marquez"
        , "Hector Herrera"
        , "Jonathan dos Santos"
        , "Giovani dos Santos"
        , "Andres Guardado"
        , "Erick Gutierrez"
        , "Marco Fabian"
        , "Javier Hernandez"
        , "Raul Jimenez"
        , "Oribe Peralta"
        , "Jesus Corona"
        , "Carlos Vela"
        , "Javier Aquino"
        , "Hirving Lozano"
        , "Jurgen Damm"
        ]
    , group = F
    }


sweden : TeamDatum
sweden =
    { team = (team "SWE" "Zweden")
    , players =
        [ "Karl-Johan Johnsson"
        , "Kristoffer Nordfeldt"
        , "Robin Olsen"
        , "Ludwig Augustinsson"
        , "Andreas Granqvist"
        , "Filip Helander"
        , "Pontus Jansson"
        , "Emil Krafth"
        , "Mikael Lustig"
        , "Victor Linderlöf"
        , "Martin Olsson"
        , "Viktor Claesson"
        , "Jimmy Durmaz"
        , "Albin Ekdal"
        , "Emil Forsberg"
        , "Oscar Hiljemark"
        , "Sebastian Larsson"
        , "Marcus Rohdén"
        , "Gustav Svensson"
        , "Marcus Berg"
        , "John Guidetti"
        , "Isaac Kiese Thelin"
        , "Ola Toivonen"
        ]
    , group = F
    }


southKorea : TeamDatum
southKorea =
    { team = { teamID = "KOR", teamName = "Zuid Korea" }
    , players =
        [ "Kim Seung-gyu"
        , "Kim Jin-hyeon"
        , "Cho Hyun-woo"
        , "Kim Young-gwon"
        , "Jang Hyun-soo"
        , "Jung Seung-hyun"
        , "Yun Yong-sun"
        , "Kwon Kyung-won"
        , "Oh Ban-suk"
        , "Kim Jin-su"
        , "Lee Yong"
        , "Kim Min-woo"
        , "Park Joo-ho"
        , "Hong Chul"
        , "Go Yo-han"
        , "Ki Sung-yueng"
        , "Jung Woo-young"
        , "Kwon Chang-hoon"
        , "Ju Se-jong"
        , "Koo Ja-cheol"
        , "Lee Jae-sung"
        , "Lee Seung-woo"
        , "Moon Seon-min"
        , "Lee Chung-yong"
        , "Kim Shin-wook"
        , "Son Heung-min"
        , "Hwang Hee-chan"
        , "Lee Keun-ho"
        ]
    , group = F
    }



-- group G


belgium : TeamDatum
belgium =
    { team = (team "BEL" "België")
    , players =
        [ "Thibaut Courtois"
        , "Simon Mignolet"
        , "Koen Casteels"
        , "Matz Sels"
        , "Toby Alderweireld"
        , "Dedryck Boyata"
        , "Jan Vertonghen"
        , "Thomas Vermaelen"
        , "Thomas Meunier"
        , "Christian Kabasele"
        , "Vincent Kompany"
        , "Laurent Ciman"
        , "Jordan Lukaku"
        , "Leander Dendoncker"
        , "Axel Witsel"
        , "Kevin De Bruyne"
        , "Marouane Fellaini"
        , "Mousa Dembele"
        , "Youri Tielemans"
        , "Yannick Carrasco"
        , "Nacer Chadli"
        , "Adnan Januzaj"
        , "Romelu Lukaku"
        , "Eden Hazard"
        , "Dries Mertens"
        , "Thorgan Hazard"
        , "Michy Batshuayi"
        , "Christian Benteke"
        ]
    , group = G
    }


panama : TeamDatum
panama =
    { team = { teamID = "PAN", teamName = "Panama" }
    , players =
        [ "José Calderon"
        , "Jaime Penedo"
        , "Alex Rodriguez"
        , "Azmahar Ariano"
        , "Felipe Baloy"
        , "Harold Cummings"
        , "Erick Davis"
        , "Fidel Escobar"
        , "Luis Ovalle"
        , "Francisco Palacios"
        , "Richard Peralta"
        , "Roman Torres"
        , "Ricardo Buitrago"
        , "Ricardo Avila"
        , "Edgar Barcenas"
        , "Miguel Camargo"
        , "Adalberto Carrasquilla"
        , "Armando Cooper"
        , "Anibal Godoy"
        , "Gabriel Gomez"
        , "Jose Gonzalez"
        , "Cristian Martinez"
        , "Valentin Pimentel"
        , "Alberto Quintero"
        , "José Luis Rodriguez"
        , "Abdiel Arroyo"
        , "Rolando Blackburn"
        , "Ismael Diaz"
        , "José Fajardo"
        , "Roberto Nurse"
        , "Blas Perez"
        , "Luis Tejada"
        , "Gabriel Torres"
        ]
    , group = G
    }


tunisia : TeamDatum
tunisia =
    { team = { teamID = "TUN", teamName = "Tunesië" }
    , players =
        [ "Mathlouthi Aymen"
        , "Ben Cherifia Moez"
        , "Ben Mustapha Farouk"
        , "Moez Hassen"
        , "Hamdi Nagguez"
        , "Dylan Bronn"
        , "Rami Bedoui"
        , "Yohan Ben Olouane"
        , "Siyam Ben Youssef"
        , "Yessine Meriah"
        , "Bilel Mohsni"
        , "Khalil Chammam"
        , "Oussama Haddai"
        , "Ali Maaloul"
        , "Elyess Skhiri"
        , "Mohamed Amine Ben Amor"
        , "Ghaylene Chalali"
        , "Karim Laaribi"
        , "Ferjani Sassi"
        , "Ahmed Khlil"
        , "Seifeddine Khaoui"
        , "Mohamed Wael Arbi"
        , "Fakhreddine Ben Youssef"
        , "Anice Badri"
        , "Bassem Srarfi"
        , "Ahmed Akaichi"
        , "Wahbi Khazri"
        , "Naim Sliti"
        , "Sabeur Khlifa"
        ]
    , group = G
    }


england : TeamDatum
england =
    { team = { teamID = "ENG", teamName = "Engeland" }
    , players =
        [ "Jack Butland"
        , "Jordan Pickford"
        , "Nick Pope"
        , "Trent Alexander-Arnold"
        , "Gary Cahill"
        , "Kyle Walker"
        , "John Stones"
        , "Harry Maguire"
        , "Kieran Trippier"
        , "Danny Rose"
        , "Phil Jones"
        , "Ashley Young"
        , "Eric Dier"
        , "Dele Alli"
        , "Jesse Lingard"
        , "Jordan Henderson"
        , "Fabian Delph"
        , "Ruben Loftus-Cheek"
        , "Jamie Vardy"
        , "Marcus Rashford"
        , "Raheem Sterling"
        , "Danny Welbeck"
        , "Harry Kane"
        ]
    , group = G
    }



-- group H


poland : TeamDatum
poland =
    { team = (team "POL" "Polen")
    , players =
        [ "Bartosz Bialkowski"
        , "Lukasz Fabianski"
        , "Lukasz Skorupski"
        , "Wojciech Szczesny"
        , "Jan Bednarek"
        , "Bartosz Bereszynski"
        , "Thiago Cionek"
        , "Kamil Glik"
        , "Michal Pazdan"
        , "Artur Jedrzejczyk"
        , "Marcin Kaminski"
        , "Tomasz Kedziora"
        , "Lukasz Piszczek"
        , "Jakub Blaszczykowski"
        , "Pawel Dawidowicz"
        , "Przemyslaw Frankowski"
        , "Jacek Goralski"
        , "Kamil Grosicki"
        , "Rafal Kurzawa"
        , "Szymon Zurkowski"
        , "Damian Kadzior"
        , "Grzegorz Krychowiak"
        , "Karol Linetty"
        , "Maciej Makuszewski"
        , "Sebastian Szymanski"
        , "Krzysztof Maczynski"
        , "Slawomir Peszko"
        , "Maciej Rybus"
        , "Piotr Zielinski"
        , "Dawid Kownacki"
        , "Robert Lewandowski"
        , "Arkadiusz Milik"
        , "Krzysztof Piatek"
        , "Lukasz Teodorczyk"
        , "Kamil Wilczek"
        ]
    , group = H
    }


senegal : TeamDatum
senegal =
    { team = { teamID = "SEN", teamName = "Senegal" }
    , players =
        [ "Abdoulaye Diallo"
        , "Alfred Gomis"
        , "Khadim Ndiaye"
        , "Lamine Gassama"
        , "Saliou Ciss"
        , "Kalidou Koulibaly"
        , "Kara Mbodji"
        , "Youssouf Sabaly"
        , "Salif Sane"
        , "Moussa Wague"
        , "Idrissa Gueye"
        , "Cheikhou Kouyate"
        , "Alfred Ndiaye"
        , "Badou Ndiaye"
        , "Cheikh Ndoye"
        , "Ismaila Sarr"
        , "Keita Balde"
        , "Mame Biram Diouf"
        , "Moussa Konate"
        , "Sadio Mane"
        , "Mbaye Niang"
        , "Diafra Sakho"
        , "Moussa Sow"
        ]
    , group = H
    }


colombia : TeamDatum
colombia =
    { team = { teamID = "COL", teamName = "Colombia" }
    , players =
        [ "David Ospina"
        , "Camilo Vargas"
        , "Iván Arboleda"
        , "José Fernando Cuadrado"
        , "Cristian Zapata"
        , "Davinson Sanchez"
        , "Santiago Arias"
        , "Oscar Murillo"
        , "Frank Fabra"
        , "Johan Mojica"
        , "Yerry Mina"
        , "William Tesillo"
        , "Bernardo Espinosa"
        , "Stefan Medina"
        , "Farid Díaz"
        , "Wílmar Barrios"
        , "Sebastián Pérez"
        , "Edwin Cardona"
        , "Carlos Sánchez"
        , "Jefferson Lerma"
        , "José Izquierdo,"
        , "James Rodríguez,"
        , "Giovanni Moreno"
        , "Abel Aguilar"
        , "Mateus Uribe"
        , "Yimmi Chará"
        , "Juan Fernando Quintero"
        , "Juan Guillermo Cuadrado"
        , "Gustavo Cuéllar"
        , "Radamel Falcao"
        , "Duvan Zapata"
        , "Miguel Borja"
        , "Carlos Bacca"
        , "Luis Fernando Muriel"
        , "Teofilo Gutiérrez"
        ]
    , group = H
    }


japan : TeamDatum
japan =
    { team = { teamID = "JPN", teamName = "Japan" }
    , players =
        []
    , group = H
    }
