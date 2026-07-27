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
/**
 ** Copyright (C) Rich Moore.  All rights reserved.
 *
 ** Redistribution and use in source and binary forms, with or without
 ** modification, are permitted provided that the following conditions
 ** are met:
 ** 1. Redistributions of source code must retain the above copyright
 **    notice, this list of conditions and the following disclaimer.
 ** 2. Redistributions in binary form must reproduce the above copyright
 **    notice, this list of conditions and the following disclaimer in the
 **    documentation and/or other materials provided with the distribution.
 *
 ** THIS SOFTWARE IS PROVIDED BY CONTRIBUTORS ``AS IS'' AND ANY
 ** EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 ** IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 ** PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE INC. OR
 ** CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 ** EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 ** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 ** PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 ** OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 ** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 ** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 **/

/////. Start CORDIC
import std.time.*
import std.collection.*
import std.math.*

let AG_CONST: Float64 = 0.6072529350

func FIXED(X: Float64): Float64 {
    return X * 65536.0
}

func FLOAT(X: Float64): Float64 {
    return X / 65536.0
}

func DEG2RAD(X: Float64): Float64 {
    return 0.017453 * (X)
}

var Angles = [FIXED(45.0), FIXED(26.565), FIXED(14.0362), FIXED(7.12502), FIXED(3.57633), FIXED(1.78991),
FIXED(0.895174), FIXED(0.447614), FIXED(0.223811), FIXED(0.111906), FIXED(0.055953), FIXED(0.027977)]

let Target = 28.027

@OverflowWrapping
func cordicsincos(Target: Float64): Float64 {
    var X: Float64
    var Y: Float64
    var TargetAngle: Float64
    var CurrAngle: Float64

    X = FIXED(AG_CONST) /* AG_CONST * cos(0) */
    Y = 0.0 /* AG_CONST * sin(0) */

    TargetAngle = FIXED(Target)
    CurrAngle = 0.0

    for (step in 0..12) {
        var NewX: Float64
        if (TargetAngle > CurrAngle) {
            NewX = X - Float64((Int64(Y) >> step))
            Y = Float64(Int64(X) >> step) + Y
            X = NewX
            CurrAngle += Angles[step]
        } else {
            NewX = X + Float64((Int64(Y) >> step))
            Y = -Float64((Int64(X) >> step)) + Y
            X = NewX
            CurrAngle -= Angles[step]
        }
    }
    return FLOAT(X) * FLOAT(Y)
}

///// End CORDIC

var total = 0.0

func cordic(runs: Int64) {
    let start = Timer().getTime()
    for (_ in 0..runs) {
        total = total + cordicsincos(Target)
    }
    let end = Timer().getTime()
    return end - start
}

/*
 *  @State
 *  @Tags Jetstream2
 */
class Benchmark {
    func run() {
        _ = cordic(25000)
        let expected = 10362.570468755888
        if (total != expected) {
            println("ERROR: bad result: expected  ${expected}   but got ${total}")
        }
    }

    /**
    * @Benchmark
    */
    func runIterationTime() {
        let start = Timer().getTime()
        for (_ in 0..80) {
            total = 0.0
            run()
        }
        let end = Timer().getTime()
        let duration = end - start
        println("math-cordic: ms = ${Float64(duration.toNanoseconds())/1000000.0}")
    }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

main() {
    Benchmark().runIterationTime()
}