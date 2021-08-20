//
//  WorldView.swift
//  GameOfLife
//
//  Created by Jaiprakash Yadav on 20/08/21.
//

import UIKit

class WorldView: UIView {

    var world: World = World(size: 10)
    var dimension: Int = 10
    var cellSize: CGFloat {
        return bounds.width / CGFloat(dimension)
    }
    var shouldStopSimulation: Bool = true

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
    
        for cell in world.cells {
            let x = CGFloat(cell.x) * cellSize
            let y = CGFloat(cell.y) * cellSize
            let rect = CGRect(x: x, y: y, width: cellSize, height: cellSize)
            var color = UIColor.white.cgColor
            if cell.state == .alive {
                color = UIColor.green.cgColor
            }
            context?.addRect(rect)
            context?.setFillColor(color)
            context?.fill(rect)
        }
        
        context?.restoreGState()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        world.updateCells()
        setNeedsDisplay()
    }
    
    func autoRun() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if !self.shouldStopSimulation {
                self.world.updateCells()
                self.setNeedsDisplay()
                self.autoRun()
            }
        }
    }
    
    func startSimulation() {
        shouldStopSimulation = false
        world = World(size: dimension)
        autoRun()
    }
    
    func stopSimulation() {
        shouldStopSimulation = true
    }
}
