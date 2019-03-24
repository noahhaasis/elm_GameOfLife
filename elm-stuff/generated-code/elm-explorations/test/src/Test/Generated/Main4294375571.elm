module Test.Generated.Main4294375571 exposing (main)

import Spec

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "Spec" [Spec.suite] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 7747720486051, processes = 8, paths = ["/home/noah/Projects/elm_playground/tests/Spec.elm"]}