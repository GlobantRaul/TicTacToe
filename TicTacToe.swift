enum Player {
        case A
        case B
}

func findWinner(_ moves: [[Int]]) -> String {
        var grid = Array(repeating: Array(repeating: "", count: 3), count: 3)
        
        for (index, move) in moves.enumerated() {
                let player = index % 2 == 0 ? Player.A : Player.B
                grid[move[0]][move[1]] = player == .A ? "X" : "O"
                
                if checkWinner(grid, player) {
                        return player == .A ? "A" : "B"
                }
        }
        
        return moves.count == 9 ? "Draw" : "Pending"
}

func checkWinner(_ grid: [[String]], _ player: Player) -> Bool {
        // Check rows and columns
        for i in 0..<3 {
                if grid[i][0] == grid[i][1] && grid[i][1] == grid[i][2] && grid[i][0] == (player == .A ? "X" : "O") {
                        return true
                }
                if grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i] && grid[0][i] == (player == .A ? "X" : "O") {
                        return true
                }
        }
        
        // Check diagonals
        if grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2] && grid[0][0] == (player == .A ? "X" : "O") {
                return true
        }
        if grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0] && grid[0][2] == (player == .A ? "X" : "O") {
                return true
        }
        
        return false
}

// Test cases
let moves = [[0,0],[1,1],[2,0],[1,0],[1,2],[2,1],[0,1]]
print(findWinner(moves))
