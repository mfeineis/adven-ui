module Main exposing (main)

import Html
import Html.Styled as Styled exposing (Html)
import Json.Decode as Decode exposing (Value)
import UI


main : Program Value Model Msg
main =
    Html.programWithFlags
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view >> Styled.toUnstyled
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [
        ]


type alias Model =
    {}


type Msg
    = Noop


init : Value -> ( Model, Cmd Msg )
init json =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    UI.mainPage []
        [ UI.mainSidebar []
            [ UI.mainSidebarItem [] [ Styled.text "M1" ]
            , UI.mainSidebarItem [] [ Styled.text "M2" ]
            , UI.mainSidebarItem [] [ Styled.text "M3" ]
            ]
        , UI.mainMenu []
            [ UI.mainMenuItem [] [ Styled.text "Main1" ]
            , UI.mainMenuItem [] [ Styled.text "Main2" ]
            ]
        , UI.mainContent []
            [ Styled.text "Hello World!"
            ]
        ]

