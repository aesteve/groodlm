import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, on, targetValue)
import Signal exposing (Address)
import StartApp.Simple as StartApp


main =
  StartApp.start { model = "Anonymous", view = view, update = update }

type Action
  = PickUpName
  | UpdateName String

update action model =
  action

view address model =
  div []
    [ input
      [ value model
      , on "input" targetValue (\string -> Signal.message address UpdateName string) ]
      []
    , button [ onClick address PickUpName ] [ text "Pick up username" ]
    ]
