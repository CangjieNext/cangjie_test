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

/* The Computer Language Benchmarks Game
   https://salsa.debian.org/benchmarksgame-team/benchmarksgame/
   contributed by Ralph Ganszky
   Added dummy element to tuple (because I read an article that this helps
   to block less writing back to memory) and store data in
   UnsafedMutablePointer to reduce overhead of array access.
   
   modified by Patrick Sy
*/
import std.time.*
import std.collection.*
import std.random.*
import std.math.*

class Timer {
    private var start_time: DateTime = DateTime.now()
    private var end_time: DateTime = DateTime.now()

    public init() {}

    public func start() {
        start_time = DateTime.now()
    }

    public func stop(): Duration {
        end_time = DateTime.now()
        end_time - start_time
    }
}

let PI = Float64.GetPI()
let SOLAR_MASS = 4.0 * PI * PI
let DAYS_PER_YEAR = 365.24

class Body {
    var x: Float64
    var y: Float64
    var z: Float64
    var vx: Float64
    var vy: Float64
    var vz: Float64
    var mass: Float64
    
    init(x!: Float64, y!: Float64, z!: Float64, vx!: Float64, vy!: Float64, vz!: Float64, mass!: Float64) {
        this.x = x
        this.y = y
        this.z = z
        this.vx = vx
        this.vy = vy
        this.vz = vz
        this.mass = mass
    }
}
func jupiter(): Body {
    return Body(
        x: 4.84143144246472090e0,
        y: -1.16032004402742839e0,
        z: -1.03622044471123109e-01,
        vx: 1.66007664274403694e-03 * DAYS_PER_YEAR,
        vy: 7.69901118419740425e-03 * DAYS_PER_YEAR,
        vz: -6.90460016972063023e-05 * DAYS_PER_YEAR,
        mass: 9.54791938424326609e-04 * SOLAR_MASS
    )
}

func saturn(): Body {
    return Body(
        x: 8.34336671824457987e0,
        y: 4.12479856412430479e0,
        z: -4.03523417114321381e-01,
        vx: -2.76742510726862411e-03 * DAYS_PER_YEAR,
        vy: 4.99852801234917238e-03 * DAYS_PER_YEAR,
        vz: 2.30417297573763929e-05 * DAYS_PER_YEAR,
        mass: 2.85885980666130812e-04 * SOLAR_MASS
    )
}

func uranus(): Body {
    return Body(
        x: 1.28943695621391310e1,
        y: -1.51111514016986312e1,
        z: -2.23307578892655734e-01,
        vx: 2.96460137564761618e-03 * DAYS_PER_YEAR,
        vy: 2.37847173959480950e-03 * DAYS_PER_YEAR,
        vz: -2.96589568540237556e-05 * DAYS_PER_YEAR,
        mass: 4.36624404335156298e-05 * SOLAR_MASS
    )
}

func neptune(): Body {
    return Body(
        x: 1.53796971148509165e1,
        y: -2.59193146099879641e1,
        z: 1.79258772950371181e-01,
        vx: 2.68067772490389322e-03 * DAYS_PER_YEAR,
        vy: 1.62824170038242295e-03 * DAYS_PER_YEAR,
        vz: -9.51592254519715870e-05 * DAYS_PER_YEAR,
        mass: 5.15138902046611451e-05 * SOLAR_MASS
    )
}

func sun(): Body {
    return Body(x: 0.0, y: 0.0, z: 0.0, vx: 0.0, vy: 0.0, vz: 0.0, mass: SOLAR_MASS)
}

var bodies: Array<Body> = [sun(), jupiter(), saturn(), uranus(), neptune()]

func advance(bodies!: Array<Body>, dt!: Float64) {
    let size = bodies.size
    
    for (i in 0..size) {
        var bodyi = bodies[i]
        var vxi = bodyi.vx
        var vyi = bodyi.vy
        var vzi = bodyi.vz
        let xi = bodyi.x
        let yi = bodyi.y
        let zi = bodyi.z
        let massi = bodyi.mass
        
        for (j in (i+1)..size) {
            var bodyj = bodies[j]
            let dx = xi - bodyj.x
            let dy = yi - bodyj.y
            let dz = zi - bodyj.z
            
            let d2 = dx * dx + dy * dy + dz * dz
            let mag = dt / (d2 * sqrt(d2))
  
            let massiMag = massi * mag
            
            let massj = bodyj.mass
            let massjMag = massj * mag
            vxi -= dx * massjMag
            vyi -= dy * massjMag
            vzi -= dz * massjMag
            
            bodyj.vx += dx * massiMag
            bodyj.vy += dy * massiMag
            bodyj.vz += dz * massiMag
            
            bodies[j] = bodyj
        }
        
        bodyi.vx = vxi
        bodyi.vy = vyi
        bodyi.vz = vzi
        
        bodyi.x += dt * vxi
        bodyi.y += dt * vyi
        bodyi.z += dt * vzi
        
        bodies[i] = bodyi
    }
}

func energy(bodies!: Array<Body>): Float64 {
    var e = 0.0
    let size = bodies.size
    
    for (i in 0..size) {
        let bodyi = bodies[i]
        e += 0.5 * bodyi.mass * (bodyi.vx * bodyi.vx + bodyi.vy * bodyi.vy + bodyi.vz * bodyi.vz)
        
        for (j in (i+1)..size) {
            let bodyj = bodies[j]
            let dx = bodyi.x - bodyj.x
            let dy = bodyi.y - bodyj.y
            let dz = bodyi.z - bodyj.z
            
            let distance = sqrt(dx * dx + dy * dy + dz * dz)
            e -= (bodyi.mass * bodyj.mass) / distance
        }
    }
    
    return e
}

func runNBody(): Int64 {
    let n = 1000000
    println(energy(bodies: bodies))
    let timer = Timer()
    timer.start()
    for (_ in 0..n) {
        advance(bodies: bodies, dt: 0.01)
    }
    let time = timer.stop()
    println("NBody - RunNBody:\t${Float64(time.toNanoseconds())/1000000.0}\tms" )
    return Int64(time.toMilliseconds())
}

main(){
    runNBody()
    return 0
}