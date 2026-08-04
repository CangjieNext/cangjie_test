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
var global = 0.0


let AG_CONST: Float64 = 0.6072529350

func FIXED( X: Float64) : Float64 {
    return X * 65536.0
}

func FLOAT(X: Float64) : Float64 {
    return X / 65536.0
}

@OverflowWrapping
func cordicsincos(Target!: Float64, Angles!: Array<Float64>) :Float64 {
    var X: Float64
    var Y: Float64
    var TargetAngle: Float64
    var CurrAngle: Float64

    X = FIXED(AG_CONST)
    Y = 0.0
    TargetAngle = FIXED(Target)
    CurrAngle = 0.0
    for (Step in 0..12) {
        var NewX: Float64 = 0.0
        if (TargetAngle > CurrAngle) {
            NewX = X - Float64((Int64(Y) >> Step))
            Y = Float64((Int64(X) >> Step)) + Y
            X = NewX
            CurrAngle += Angles[Step]
        } else {
            NewX = X + Float64((Int64(Y) >> Step))
            Y = -Float64((Int64(X) >> Step)) + Y
            X = NewX
            CurrAngle -= Angles[Step]
        }
    }
    return FLOAT(X) * FLOAT(Y)
}

func RunCordic() :Int64 {
    var res:Float64 = 0.0
    let Target: Float64 = 28.027
    let input = 150000
    let Angles: Array<Float64> = [
    FIXED(45.0), FIXED(26.565), FIXED(14.0362), FIXED(7.12502),
    FIXED(3.57633), FIXED(1.78991), FIXED(0.895174), FIXED(0.447614),
    FIXED(0.223811), FIXED(0.111906), FIXED(0.055953),
    FIXED(0.027977)
    ]
    timer.start()
    for (i in 0..input) {
        res += cordicsincos(Target: (Target + Float64(i)), Angles: Angles)
    }
    let time = timer.stop()
    global = res;
    // XCTAssertEqual(res, 0.4145028187500179)
    print("Numerical Calculation - RunCordic:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
    return Int64(time.toMilliseconds())
}

main(){
    RunCordic()
    print("Cordic Is End , global value is ${global}\n")
    return 0

}
