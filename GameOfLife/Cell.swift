//
//  Cell.swift
//  GameOfLife
//
//  Created by Jaiprakash Yadav on 20/08/21.
//

import Foundation

struct Cell {
    let x: Int
    let y: Int
    var state: State
    
    func isNeighbour(to cell: Cell) -> Bool {
        let xDelta = abs(cell.x - x)
        let yDelta = abs(cell.y - y)
        
        switch (xDelta, yDelta) {
        case (1, 1), (0, 1), (1, 0):
            return true
        default:
            return false
        }
    }
}
