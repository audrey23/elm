import Graphics.Element exposing (show)
import List exposing (..)
import Html exposing (Html, Attribute, text, toElement, div, input)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetValue)
import Signal exposing (Address)
import StartApp.Simple as StartApp
import String

--main =
    --show (countNum 7 100)
    
countNum multiple max =
    [0..max]
    |> List.filter (\item -> item % multiple == 0)
    |> List.sum 
    

main =
  StartApp.start { model = (7, 100), view = view, update = update }


update (multiple, max) (oldMull, oldMax) =
  (multiple, max)


view : Address (int, int) -> String -> Html
view address (multiple, max) =
  div []
    [ input
        [ placeholder "multple"
        , value multiple
        , on "input" targetValue (Signal.message address)
                ]
        []
    , div [] [ text ( string (countNum multiple max))]
    ]


