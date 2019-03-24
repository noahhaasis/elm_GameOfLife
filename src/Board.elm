module Board exposing (emptyBoard, Board, Pos, CellState, setAlive, evolve, cellState)
import Set

type CellState
    = Dead
    | Alive

type alias Pos = (Int, Int)

type alias Board = Set.Set Pos -- Set of all living cells

emptyBoard : Board
emptyBoard = Set.empty

evolve : Board -> Board
evolve b =
    let
        livingCells = Set.toList b
        maybeChangedCells = (List.concatMap neighbors livingCells) ++ livingCells
    in
        Set.fromList (List.filter (\c -> updatedCellState b c == Alive) maybeChangedCells)

setAlive : Pos -> Board -> Board
setAlive = Set.insert

neighborStates : Board -> Pos -> List CellState
neighborStates b p = List.map (cellState b) (neighbors p)

neighbors : Pos -> List Pos
neighbors (x, y) =
    [(x-1, y)
    ,(x-1, y-1)
    ,(x-1, y+1)
    ,(x+1, y)
    ,(x+1, y-1)
    ,(x+1, y+1)
    ,(x  , y-1)
    ,(x  , y+1)]

cellState : Board -> Pos -> CellState
cellState b p = if Set.member p b then Alive else Dead

updatedCellState : Board -> Pos -> CellState
updatedCellState b p =
    let
        livingNeighbors = List.length (List.filter ((==) Alive) (neighborStates b p))
    in
      case cellState b p of
          Alive -> if livingNeighbors == 2 || livingNeighbors == 3 then Alive else Dead
          Dead  -> if livingNeighbors == 3 then Alive else Dead
