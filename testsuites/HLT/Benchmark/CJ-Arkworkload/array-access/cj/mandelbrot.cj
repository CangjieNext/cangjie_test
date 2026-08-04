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

let timer = Timer()

func Mandelbrot() {
    let w: Int64 = 1000
    let h = w
    var bit_num = 0
    var  i = 0
    var byte_acc = 0
    let iter = 50
    var  limit = 2.0
    var Zr:Float64 
    var Zi:Float64 
    var Cr:Float64  
    var Ci:Float64  
    var Tr:Float64 
    var Ti:Float64  
    var res = 0
    let limit2 = limit * limit

    for (y in 0..h) {
        Ci = 2.0*Float64(y)/Float64(h) - 1.0
        for (x in 0..w) {
            Zr = 0.0; Zi = 0.0; Tr = 0.0; Ti = 0.0
            Cr = 2.0*Float64(x)/Float64(w) - 1.5;
            i = 0
            while (i < iter && (Tr+Ti <= limit2)) {
                i += 1
                Zi = 2.0*Zr*Zi + Ci
                Zr = Tr - Ti + Cr
                Tr = Zr * Zr
                Ti = Zi * Zi
            }
            byte_acc <<= 1
            if (Tr+Ti <= limit2) {
                byte_acc |= 0x01
            }
            bit_num += 1
            if (bit_num == 8) {
                res += byte_acc
 
                byte_acc = 0
                bit_num = 0
            } else if (x == w-1) {
                byte_acc <<= (8-w%8)
 
                res += byte_acc
                byte_acc = 0
                bit_num = 0
            }
        }
    }
    println(res)

}

func runMandelbrot():Int64{
    timer.start()
    Mandelbrot();
    let time = timer.stop()

    println("Array Access - RunMandelbrot:\t${Float64(time.toNanoseconds())/1000000.0}\tms");
    return  Int64(time.toMilliseconds())
}

main(){
   runMandelbrot()
   return 0
}


