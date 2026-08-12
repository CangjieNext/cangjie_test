/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms

import std.time.*
import std.collection.*
import std.math.*

var nsFrameCounter = 0
let factor: Float64 = 0.5
let densFactor: Float64 = 10.0
let point: Int64 = 64
let repeatCount: Int64 = 15
let checkIndex: Int64 = 7000
let checkIndexTo: Int64 = 7100
let indexTwo: Int64 = 2
let point2: Int64 = 128
let resultOK: Int64 = 77
let densInt0: Float64 = 5.0
let densInt1: Float64 = 20.0
let densInt2: Float64 = 30.0
let itersMax: Int64 = 100
let pointMax: Int64 = 1000000
let solveNumber: Float64 = 4.0
let multiple: Float64 = 1000.0
let runCount: Int64 = 120

var solver = FluidField()

func runNavierStokes()  {
    solver.update()
    nsFrameCounter += 1
    if (nsFrameCounter == repeatCount) {
        checkResult(solver.getDens())
    }
}

func checkResult(dens: Array<Float64>)  {
    var result = 0
    for (i in checkIndex..checkIndexTo) {
        let sss = dens[i] * densFactor
        result += Int64(sss)
//        log("single result[\(i)] = \(sss)")
    }
//    log("checkResult result = \(result)")
    if (result != resultOK) {
//        log("nsFrameCounter = \(nsFrameCounter) checksum failed")
    } else {
//        log("nsFrameCounter = \(nsFrameCounter) checksum success")
    }
}
/*
 * @Setup
 */
func setupNavierStokes() {
    solver = FluidField()
    solver.setResolution(point2, point2)
    solver.setIterations(Int64(densInt1))
    solver.reset()
}

var framesTillAddingPoints = 0;
var framesBetweenAddingPoints = 5;

class FluidField {
    var iterations: Int64 = 10
    var visc: Float64 = 0.5
    var dt: Float64 = 0.1
    var dens: Array<Float64> = Array<Float64>()
    var densPrev: Array<Float64> = Array<Float64>()
    var u: Array<Float64> = Array<Float64>()
    var uPrev: Array<Float64> = Array<Float64>()
    var v: Array<Float64> = Array<Float64>()
    var vPrev: Array<Float64> = Array<Float64>()
    var width: Int64 = 0
    var height: Int64 = 0
    var rowSize: Int64 = 0
    var size: Int64 = 0

    init() {
        iterations = 10
        visc = 0.5
        dt = 0.1
        this.setResolution(point, point)
    }
    
    func addFields(x: Array<Float64>, s: Array<Float64>, dt: Float64) {
        for (i in 0..size) {
            x[i] += dt * s[i]
        }
    }

    func setBnd(b: Int64, x: Array<Float64>) {
        if (b == 1) {
            for (i in 1..=this.width) {
                x[i] = x[i + this.rowSize]
                x[i + (this.height + 1) * this.rowSize] = x[i + this.height * this.rowSize]
            }
            for (j in 1..=this.height) {
                x[j * this.rowSize] = -x[1 + j * this.rowSize]
                x[(this.width + 1) + j * this.rowSize] = -x[this.width + j * this.rowSize]
            }
        } else if (b == indexTwo ) {
            for (i in 1..=this.width) {
                x[i] = -x[i + this.rowSize]
                x[i + (this.height + 1) * this.rowSize] = -x[i + this.height * this.rowSize]
            }
            for (j in 1..=this.height) {
                x[j * this.rowSize] = x[1 + j * this.rowSize]
                x[(this.width + 1) + j * this.rowSize] = x[this.width + j * this.rowSize]
            }
        }
        else {
            for (i in 1..=this.width) {
                x[i] = x[i + this.rowSize]
                x[i + (this.height + 1) * this.rowSize] = x[i + this.height * this.rowSize]
            }
            for (j in 1..=this.height) {
                x[j * this.rowSize] = x[1 + j * this.rowSize]
                x[(this.width + 1) + j * this.rowSize] = x[this.width + j * this.rowSize]
            }
        }
        
        let maxEdge = (this.height + 1) * this.rowSize
        x[0] = factor * (x[1] + x[this.rowSize])
        x[maxEdge] = factor * (x[1 + maxEdge] + x[this.height * this.rowSize])
        x[(this.width + 1)] = factor * (x[this.width] + x[(this.width + 1) + this.rowSize])
        x[(this.width + 1) + maxEdge] = factor * (x[this.width + maxEdge] + x[(this.width + 1) + this.height * this.rowSize])
    }

    func linSolveElse(x: Array<Float64>, x0: Array<Float64>, a: Int64, invC: Float64) {
        for (j in 1..this.height+1) {
            var lastRow = (j - 1) * this.rowSize
            var currentRow = j * this.rowSize
            var nextRow = (j + 1) * this.rowSize
            var lastX = x[currentRow]
            currentRow += 1
            for (_ in 1..this.width+1) {
                x[currentRow] = (x0[currentRow] + Float64(a) * (lastX + x[currentRow + 1] + x[lastRow + 1] + x[nextRow + 1])) * invC
                lastX = x[currentRow]
                currentRow += 1
                lastRow += 1
                nextRow += 1
            }
        }
    }

    func linSolve(b: Int64, x: Array<Float64>, x0: Array<Float64>, a: Int64, c: Int64) {
        if (a == 0 && c == 1) {
            for (j in 1..=this.height) {
                var currentRow = j * rowSize
                currentRow += 1
                for (_ in 1..=width) {
                    x[currentRow] = x0[currentRow]
                    currentRow += 1
                }
            }
            setBnd(b, x)
        } else {
            let invC = 1.0 / Float64(c)
            for (_ in 0..this.iterations) {
                linSolveElse(x, x0, a, invC)
                setBnd(b, x)
            }
        }
    }

    func diffuse(b: Int64, x: Array<Float64>, x0: Array<Float64>, dt: Float64) {
        let a = 0
        linSolve(b, x, x0, a, 1 + Int64(solveNumber) * a)
    }

    func linSolveElse2(x: Array<Float64>, x0: Array<Float64>, y: Array<Float64>, y0: Array<Float64>, a: Int64, invC: Float64) {
        for (j in 1..=this.height) {
            var lastRow = (j - 1) * this.rowSize
            var currentRow = j * this.rowSize
            var nextRow = (j + 1) * this.rowSize
            var lastX = x[currentRow]
            var lastY = y[currentRow]
            currentRow += 1
            for (_ in 1..=this.width) {
                x[currentRow] = (x0[currentRow] + Float64(a) * (lastX + x[currentRow] + x[lastRow] + x[nextRow])) * invC
                lastX = x[currentRow]
                y[currentRow] = (y0[currentRow] + Float64(a) * (lastY + y[currentRow + 1] + y[lastRow + 1] + y[nextRow + 1])) * invC
                lastY = y[currentRow]
                currentRow += 1
                lastRow += 1
                nextRow += 1
            }
        }
    }

    func linSolve2(x: Array<Float64>, x0: Array<Float64>, y: Array<Float64>, y0: Array<Float64>, a: Int64, c: Int64) {
        if (a == 0 && c == 1) {
            for (j in 1..=height) {
                var currentRow = j * rowSize
                currentRow += 1
                for (_ in 1..=width) {
                    x[currentRow] = x0[currentRow]
                    y[currentRow] = y0[currentRow]
                    currentRow += 1
                }
            }
            setBnd(1, x)
            setBnd(2, y)
        } else {
            let invC = 1.0 / Float64(c)
            for (_ in 0..this.iterations) {
                linSolveElse2(x, x0, y, y0, a, invC)
                setBnd(1, x)
                setBnd(indexTwo, x)
            }
        }
    }

    func diffuse2(x: Array<Float64>, x0: Array<Float64>, y: Array<Float64>, y0: Array<Float64>, dt: Float64) {
        let a = 0
        this.linSolve2(x, x0, y, y0 , a, 1 + 4 * a)
    }

    @OverflowWrapping
    func advect( b: Int64,  d: Array<Float64>, d0: Array<Float64>,  u: Array<Float64>,  v: Array<Float64>,  dt: Float64) {

        let wdt0 = dt * Float64(this.width)
        let hdt0 = dt * Float64(this.height)
        let wp5 = Float64(this.width) + 0.5
        let hp5 = Float64(this.height) + 0.5
        
        for (j in 1..=this.height) {
            var pos = j * this.rowSize
            for (i in 1..=this.width) {
                pos += 1
                var x = Float64(i) - wdt0 * u[pos]
                var y = Float64(j) - hdt0 * v[pos]
                
                if (x < 0.5) {
                    x = 0.5
                } else if (x > wp5) {
                    x = wp5
                }
                
                let i0 = Int64(x)
                let i1 = i0 + 1
                
                if (y < 0.5) {
                    y = 0.5
                } else if (y > hp5) {
                    y = hp5
                }
                
                let j0 = Int64(y)
                let j1 = j0 + 1
                
                let s1 = x - Float64(i0)
                let s0 = 1.0 - s1
                let t1 = y - Float64(j0)
                let t0 = 1.0 - t1
                
                let row1 = j0 * this.rowSize
                let row2 = j1 * this.rowSize
                
                d[pos] = s0 * (t0 * d0[i0 + row1] + t1 * d0[i0 + row2]) + s1 * (t0 * d0[i1 + row1] + t1 * d0[i1 + row2])
                
            }
        }
        this.setBnd(b, d)
    }

    @OverflowWrapping
    func project(u: Array<Float64>, v: Array<Float64>, p: Array<Float64>, div: Array<Float64>) {
        let h = -factor / sqrt(Float64(width) * Float64(height))
        for (j in 1..=height) {
            let row = j * rowSize
            var previousRow = (j - 1) * rowSize
            var prevValue = row - 1
            var currentRow = row
            var nextValue = row + 1
            var nextRow = (j + 1) * rowSize
            for (_ in 1..=width) {
                currentRow += 1
                nextValue += 1
                prevValue += 1
                nextRow += 1
                previousRow += 1
                div[currentRow] = Float64(h) * (u[nextValue] - u[prevValue] + v[nextRow] - v[previousRow])
                p[currentRow] = 0.0
            }
        }
        
        setBnd(0, div)
        setBnd(0, p)
        linSolve(0, p, div, 1, Int64(solveNumber))

        let wScale = factor * Float64(width)
        let hScale = factor * Float64(height)
        for (j in 1..=height) {
            var prevPos = j * rowSize - 1
            var currentPos = j * rowSize
            var nextPos = j * rowSize + 1
            var prevRow = (j - 1) * rowSize
            var nextRow = (j + 1) * rowSize
            for (_ in 1..=width) {
                currentPos+=1
                nextPos+=1
                prevPos+=1
                u[currentPos] -= wScale * (p[nextPos] - p[prevPos])
  
                nextRow+=1
                prevRow+=1
                v[currentPos] -= hScale * (p[nextRow] - p[prevRow])
            }
        }

        setBnd(1, u)
        setBnd(indexTwo, v)
    }

    func densStep(x: Array<Float64>, x0: Array<Float64>, u: Array<Float64>, v: Array<Float64>, dt: Float64) {
        this.addFields(x, x0, dt)
        this.diffuse(0, x0, x, dt)
        this.advect(0, x, x0, u, v, dt)
    }

    func velStep(u: Array<Float64>, v: Array<Float64>, u0: Array<Float64>, v0: Array<Float64>, dt: Float64) {
        this.addFields(u, u0, dt)
        this.addFields(v, v0, dt)
        var uu = Array<Float64>()
        var uu0 = Array<Float64>()   
        var vv = Array<Float64>()
        var vv0 = Array<Float64>()  
        (uu, uu0) = (u0, u)
        (vv, vv0) = (v0, v) 
        this.diffuse2(uu, uu0, vv, vv0, dt)
        this.project(uu, vv, uu0, vv0)

        var uuu = Array<Float64>()
        var uuu0 = Array<Float64>()   
        var vvv = Array<Float64>()
        var vvv0 = Array<Float64>()  
        (uuu, uuu0) = (uu0, uu)
        (vvv, vvv0) = (vv0, vv) 
        this.advect(1, uuu, uuu0, uuu0, vvv0, dt)
        this.advect(indexTwo, vvv, vvv0, uuu0, vvv0, dt)
        this.project(uuu, vvv, uuu0, vvv0)
        
    }

    func queryUI(d: Array<Float64>, u: Array<Float64>, v: Array<Float64>) {
        for (i in 0..size) {
            u[i] = 0.0
            v[i] = 0.0
            d[i] = 0.0
        }
        this.prepareFrame(d, u, v)
    }

    func setDensity(fdens: Array<Float64>, x: Int64, y: Int64, d: Float64) {
        fdens[(x + 1) + (y + 1) * this.rowSize] = d
    }

    func setVelocity(fu:Array<Float64>, fv:Array<Float64>, x: Int64, y: Int64, xv: Float64, yv: Float64) {
        fu[(x + 1) + (y + 1) * this.rowSize] = xv
        fv[(x + 1) + (y + 1) * this.rowSize] = yv
    }

    func prepareFrame(fdens:Array<Float64>, fu:Array<Float64>, fv:Array<Float64>){
        if (framesTillAddingPoints == 0) {
            let n = 64
            for (i in 1..=n) {
                this.setVelocity(fu, fv, i, i, Float64(n), Float64(n))
                this.setDensity(fdens, i, i, densInt0)
                this.setVelocity(fu, fv, i, n - i, Float64(-n), Float64(-n))
                this.setDensity(fdens, i, n - i, densInt1)
                this.setVelocity(fu, fv, point2 - i, n + i, Float64(-n), Float64(-n))
                this.setDensity(fdens, point2 - i, n + i, densInt2)
            }
            framesTillAddingPoints = framesBetweenAddingPoints
            framesBetweenAddingPoints += 1
        } else {
            framesTillAddingPoints -= 1
        }
    }

    func update() {
        queryUI(this.densPrev, this.uPrev, this.vPrev)
        velStep(this.u, this.v, this.uPrev, this.vPrev, this.dt)
        densStep(this.dens, this.densPrev, this.u, this.v, this.dt)
    }

    func setIterations(iters: Int64) {
        if (iters > 0 && iters <= itersMax) {
            this.iterations = iters
        }
    }

    func reset() {
        this.rowSize = width + indexTwo
        this.size = (width + indexTwo) * (height + indexTwo)
        this.dens = Array<Float64>(this.size, { x:Int64 => 0.0})
        this.densPrev = Array<Float64>(this.size, { x:Int64 => 0.0})
        this.u = Array<Float64>(this.size, { x:Int64 => 0.0})
        this.uPrev = Array<Float64>(this.size, { x:Int64 => 0.0})
        this.v = Array<Float64>(this.size, { x:Int64 => 0.0})
        this.vPrev = Array<Float64>(this.size, { x:Int64 => 0.0})
    }

    func getDens(): Array<Float64> {
        return this.dens
    }

    func setResolution(hRes: Int64, wRes: Int64) : Bool {
        let res = wRes * hRes
        if (res > 0 && res < pointMax && (wRes != width || hRes != height)) {
            this.width = wRes
            this.height = hRes
            this.reset()
            return true
        } else {
            return false
        }
    }
}


/*
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
    init() {
        setupNavierStokes()
    }

    func runIteration(index: Int) {
        runNavierStokes()
    }
    /*
     * @Benchmark
     */
    func run() {
        let start = Timer().getTime()
        let bechMark = Benchmark()
        for( _ in 1..=120) {
            bechMark.runIteration(0)
        }
        let end = Timer().getTime()
        println("navier-stokes: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
    }
}
class Timer {
    private var start_time: DateTime = DateTime.now()
    private var end_time: DateTime = DateTime.now()

    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

let debug : Bool = false
func log(msg: String){
    if (debug) {
        let prefix = "${msg}"
        println(prefix)
    }
}

main() {
    Benchmark().run()
}
