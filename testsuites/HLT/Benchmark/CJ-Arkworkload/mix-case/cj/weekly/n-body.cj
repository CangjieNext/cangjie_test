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
import std.random.*
import std.math.*

var PI = 3.141592653589793
var SOLAR_MASS = 4.0 * PI * PI
var DAYS_PER_YEAR = 365.24

class Body {
    var x: Float64
    var y: Float64
    var z: Float64
    var vx: Float64
    var vy: Float64
    var vz: Float64
    var mass: Float64
    
    init(x: Float64, y: Float64, z: Float64, vx: Float64, vy: Float64, vz: Float64, mass: Float64) {
        this.x = x
        this.y = y
        this.z = z
        this.vx = vx
        this.vy = vy
        this.vz = vz
        this.mass = mass
    }

    func offsetMomentum(px : Float64, py :Float64, pz : Float64): Body {
        vx = -px / SOLAR_MASS
        vy = -py / SOLAR_MASS
        vz = -pz / SOLAR_MASS
        return this
    }

}
func Jupiter(): Body {
    return Body(
        4.84143144246472090e0,   //init data x,y,z 
        -1.16032004402742839e0,
        -1.03622044471123109e-01,
        1.66007664274403694e-03 * DAYS_PER_YEAR,   //init data vx,vy,vz 
        7.69901118419740425e-03 * DAYS_PER_YEAR,
        -6.90460016972063023e-05 * DAYS_PER_YEAR,
        9.54791938424326609e-04 * SOLAR_MASS
    )
}

func Saturn(): Body {
    return Body(
        8.34336671824457987e0,   //init data x,y,z 
        4.12479856412430479e0,
        -4.03523417114321381e-01,
        -2.76742510726862411e-03 * DAYS_PER_YEAR,  //init data vx,vy,vz
        4.99852801234917238e-03 * DAYS_PER_YEAR,
        2.30417297573763929e-05 * DAYS_PER_YEAR,
        2.85885980666130812e-04 * SOLAR_MASS
    )
}

func Uranus(): Body {
    return Body(
        1.28943695621391310e1,   //init data x,y,z 
        -1.51111514016986312e1,
        -2.23307578892655734e-01,
        2.96460137564761618e-03 * DAYS_PER_YEAR,  //init data vx,vy,vz
        2.37847173959480950e-03 * DAYS_PER_YEAR,
        -2.96589568540237556e-05 * DAYS_PER_YEAR,
        4.36624404335156298e-05 * SOLAR_MASS
    )
}

func Neptune(): Body {
    return Body(
        1.53796971148509165e1,   //init data x,y,z 
        -2.59193146099879641e1,
        1.79258772950371181e-01,
        2.68067772490389322e-03 * DAYS_PER_YEAR,  //init data vx,vy,vz
        1.62824170038242295e-03 * DAYS_PER_YEAR,
        -9.51592254519715870e-05 * DAYS_PER_YEAR,
        5.15138902046611451e-05 * SOLAR_MASS
    )
}

func Sun(): Body {
    return  Body(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, SOLAR_MASS)
}


class NBodySystem {
    var bodies: Array<Body>
    
    init(bodies: Array<Body>) {
        this.bodies = bodies
        var px = 0.0
        var py = 0.0
        var pz = 0.0
        
        let size = bodies.size
        for (i in 0..size) {
            let b = bodies[i]
            let m = b.mass
            px += b.vx * m
            py += b.vy * m
            pz += b.vz * m
        }
        
        _ = this.bodies[0].offsetMomentum(px, py, pz)
    }
    
    func advance(dt: Float64) {
        var dx: Float64
        var dy: Float64
        var dz: Float64
        var distance: Float64
        var mag: Float64
        let size = this.bodies.size
        
        for (i in 0..size) {
            let bodyi = this.bodies[i]
            
            for (j in i+1..size) {
                let bodyj = this.bodies[j]
                dx = bodyi.x - bodyj.x
                dy = bodyi.y - bodyj.y
                dz = bodyi.z - bodyj.z
                
                distance = sqrt(dx*dx + dy*dy + dz*dz)
                mag = dt / (distance * distance * distance)
                
                bodyi.vx -= dx * bodyj.mass * mag
                bodyi.vy -= dy * bodyj.mass * mag
                bodyi.vz -= dz * bodyj.mass * mag
                
                bodyj.vx += dx * bodyi.mass * mag
                bodyj.vy += dy * bodyi.mass * mag
                bodyj.vz += dz * bodyi.mass * mag
            }
        }

        for (i in 0..size) {
            let body = this.bodies[i]
            body.x += dt * body.vx
            body.y += dt * body.vy
            body.z += dt * body.vz
        }
    }
    
    func energy(): Float64 {
        var dx: Float64
        var dy: Float64
        var dz: Float64
        var distance: Float64

        var e = 0.0
        let size = this.bodies.size
        
        for (i in 0..size) {
            let bodyi = this.bodies[i]
            
            e += 0.5 * bodyi.mass *
            ( bodyi.vx * bodyi.vx
            + bodyi.vy * bodyi.vy
            + bodyi.vz * bodyi.vz )
            
            for (j in i+1..size) {
                 let bodyj = this.bodies[j]
                 dx = bodyi.x - bodyj.x
                 dy = bodyi.y - bodyj.y
                 dz = bodyi.z - bodyj.z

                 distance = sqrt(dx*dx + dy*dy + dz*dz)
                 e -= (bodyi.mass * bodyj.mass) / distance
              }
        }
        return e
    }
    
}

func run() {
    var ret: Float64 = 0.0
    
    var n: Int64 = 3
    while (n <= 24) {
        let planets: Array<Body> = [Sun(),Jupiter(),Saturn(),Uranus(),Neptune()]
        let bodies = NBodySystem(planets)
        let max = n * 100
        ret += bodies.energy()

        for (_ in 0..max) {
            bodies.advance(0.01)
        }
        ret += bodies.energy()
        n *= 2
    }
    
    let expected: Float64 = -1.3524862408537381
    if (ret != expected) { 
        println( "ERROR: bad result: expected ${expected} but got ${ret}") 
        }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

  /*
   * @State
   * @Tags Jetstream2
   */
class Benchmark {
  
  /*
   *@Benchmark
   */
    func runIterationTime() {
        let start = Timer().getTime()
        for (_ in 0..8) {
            run()
        }
        let end = Timer().getTime()
        let duration = end - start
        println("n-body: ms = ${Float64(duration.toNanoseconds())/1000000.0}")
    }
}

main(){
    Benchmark().runIterationTime()
}