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

/*
* @State
* @Tags Jetstream2
*/
class Morph {
    
    var loops: Int64 = 15
    var nx: Int64 = 120
    var nz: Int64 = 120
    
    
    func morph(arr: ArrayList<Float64>, f: Float64) {
        let PI2nx = Float64.GetPI() * 8.0 / Float64(nx)
        let f30 = -(50.0 * sin(f * Float64.GetPI() * 2.0))
        for (i in 0..nz) {
            for (j in 0..nx) {
                let index = 3 * (i * nx + j) + 1
                let x = Float64((j - 1)) * PI2nx
                arr[index] = Float64(sin(x)) * (-f30)
                if (index % 317 == 1) {
                    
                }
            }
        }
    }
    /*
    *@Benchmark
    */
    func runTest() {
        var a: ArrayList<Float64> = ArrayList<Float64>(nx * nx * 3, {x: Int64 => 0.0})
        for (index in 0..(nx * nx * 3)) {
            a[index] = 0.0
        }
        
        for (i in 0..loops) {
            morph(a, Float64(i) / Float64(loops))
        }
        
        var testOutput: Float64 = 0.0
        for (i in 0..nx) {
            let index = 3 * (i * nx + 1) + 1
            if (index >= a.size) {
                break
            }
            testOutput += a[index]
        }

                
        var epsilon = 1e-13
        
        if (abs(testOutput) >= Float64(epsilon)) {
            println("Error: bad test output: expected magnitude below" + "${epsilon}" + "but got" + "${testOutput}")
        }
        
    }
    
}

let isDebug : Bool = false


class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

/// @Benchmark
func run() {
    let start = Timer().getTime()
    let morph = Morph()
    for (_ in 0..80) {
        morph.runTest()
    }
    let end = Timer().getTime()
    println("3d-morph: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
    
}

main() {
    run()
}