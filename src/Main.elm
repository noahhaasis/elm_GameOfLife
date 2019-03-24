module Main exposing (..)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Board exposing (..)


-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL


type alias Model =
    { board : Board }


init : Model
init = Model emptyBoard


-- UPDATE


type Msg
  = TODO


update : Msg -> Model -> Model
update msg model = {model | board = evolve (model.board)}


-- VIEW

cellsPerRow = 40 -- TODO

-- cellView : CellState -> Html
-- cellView = div [] ""

view : Model -> Html Msg
view model = text "todo"
