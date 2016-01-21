import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, on, targetValue)
import Signal exposing (Address)
import StartApp.Simple as StartApp

type alias Model =
  { username : String
  , typing : String
  }

init : Model
init =
  Model "Anonymous" "Anonymous"

main =
  StartApp.start { model = init, view = view, update = update }

type Action
  = PickUpName
  | UpdateName String

update action model =
  case action of
    PickUpName ->
      { model | username = model.typing }
    UpdateName name ->
      { model | typing = name }

view address model =
  div []
    [ h1 [] [ text ("Hello " ++ model.username)]
    , input
      [ value model.typing
      , on "input" targetValue (\val -> Signal.message address(UpdateName val)) ]
      []
    , button [ onClick address PickUpName ] [ text "Pick up username" ]
    ]
