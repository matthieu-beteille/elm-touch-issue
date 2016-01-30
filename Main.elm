module Main where

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (on, onClick)
import Json.Decode exposing ( (:=) )
import StartApp.Simple exposing (start)

main =
  start
    { model = 0
    , update = update
    , view = view
    }


-- MODEL

type alias Model = Int

-- UPDATE

type Action = Increment | Decrement

update : Action -> Model -> Model
update action model =
  case action of
    Increment ->
      model + 1

    Decrement ->
      model - 1


 -- decode altKey : an attribute which is in both touch events and  mouse events (it should work in both cases)
decoder =
  Json.Decode.object1 identity ("altKey" := Json.Decode.bool)

-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ button [ on "click" decoder (\_ -> Signal.message address Decrement) ] [ text "-" ]
    , div [ countStyle ] [ text (toString model) ]
    , button [ on "touchend" decoder (\_ -> Signal.message address Increment) ] [ text "+" ]
    ]


countStyle : Attribute
countStyle =
  style
    [ ("font-size", "20px")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]
