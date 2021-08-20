//
//  World.swift
//  GameOfLife
//
//  Created by Jaiprakash Yadav on 20/08/21.
//

import Foundation

class World {
    var cells = [Cell]()
    let size: Int
    
    init(size: Int) {
        self.size = size
        
        fillCells()
    }
    
    func fillCells() {
        for col in 0 ..< size {
            for row in 0 ..< size {
                let random = Int.random(in: 0 ..< 3)
                let randomState: State = random == 0 ? .alive : .dead
                let cell = Cell(x: row, y: col, state: randomState)
                cells.append(cell)
            }
        }
    }
    
    func updateCells() {
        var updatedCells = [Cell]()
        let liveCells = cells.filter({ $0.state == .alive })
        for cell in cells {
            let livingNeighbours = liveCells.filter({
                $0.isNeighbour(to: cell)
            })
            
            switch livingNeighbours.count {
            case 2...3 where cell.state == .alive:
                updatedCells.append(cell)
            case 3 where cell.state == .dead:
                let liveCell = Cell(x: cell.x, y: cell.y, state: .alive)
                updatedCells.append(liveCell)
            default:
                let deadCell = Cell(x: cell.x, y: cell.y, state: .dead)
                updatedCells.append(deadCell)
            }
        }
        
        cells = updatedCells
    }
}
