port module Main exposing (main)

import Browser
import Html exposing (Html, button, div, img, p, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)



-- ports
-- Send the value to Js to save it in localstorage


port sendCounterValue : Int -> Cmd msg



-- Get a string message form the JS side


port sendMsgFromJs : (String -> msg) -> Sub msg


type alias Flags =
    Int



-- Model


type alias Model =
    { count : Int
    , info : String
    , msgFromJs : Maybe String
    }


type Msg
    = Increment
    | Decrement
    | Enter String
    | Leave String
    | GotMsgFromJS String



--update


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        Increment ->
            ( { model | count = model.count + 1 }, sendCounterValue <| model.count + 1 )

        Decrement ->
            ( { model | count = model.count - 1 }, sendCounterValue <| model.count - 1 )

        Enter message ->
            ( { model | info = message }, Cmd.none )

        Leave message ->
            ( { model | info = message }, Cmd.none )

        GotMsgFromJS message ->
            ( { model | msgFromJs = Just message }, Cmd.none )


init : Flags -> ( Model, Cmd msg )
init flags =
    ( { count = flags
      , info = "Move the mouse over the image"
      , msgFromJs = Nothing
      }
    , Cmd.none
    )



--view


view : Model -> Html Msg
view model =
    div [ class "parent" ]
        [ div [ class "btn btn-primary my-5" ] [ button [ onClick Increment ] [ text "Add 1" ] ]
        , div [ class "text-2xl" ] [ text <| "Counter = " ++ String.fromInt model.count ]
        , div [ class "btn btn-primary my-5" ] [ button [ onClick Decrement ] [ text "Sub 1" ] ]
        , div [ class "parent" ]
            [ img
                [ src "/images/placeholder.png"
                , class "small-img"
                , onMouseEnter (Enter "over the image")
                , onMouseLeave (Leave "Move the mouse over the image")
                ]
                []
            , p [] [ text model.info ]
            , p [ class "white-space-pre" ]
                [ case model.msgFromJs of
                    Nothing ->
                        text "\u{200B}"

                    Just msg ->
                        text msg
                ]
            ]
        ]



--subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
    sendMsgFromJs GotMsgFromJS


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
