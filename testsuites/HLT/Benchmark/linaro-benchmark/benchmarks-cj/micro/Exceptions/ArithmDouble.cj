/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// RUN-EXEC: %export cjHeapSize=16GB && %export JETVMPROP="-Xmx2G" && %run %run_opt %output %run_args

import std.process.*
import std.time.*
import std.convert.*
import std.convert.*

class Exceptions {
    private var smallArray : Array<Int32> = Array<Int32>(1, repeat:0)
    private static let ARITHM_DOUBLE_ITERS :Int32 = 20000
    private  var mumber_p :Int32 = -21

    @OverflowWrapping
    private func arithmDouble(n:Int32):Int32 {
        var x :Float64  = 1.0 * Float64(n)
        var y :Float64  = 2.0 * Float64(n)
        var z :Float64  = 3.0 * Float64(n)
        var expr :Float64  = 0.0
        var a :Int32  = 0
        for(i in 0..ARITHM_DOUBLE_ITERS){
            expr += x + y + z * x + y * y + x * z
            a = smallArray[0]
        }

        return Int32(expr) + a + Int32(x) + Int32(y) + Int32(z)
    }

    @OverflowWrapping
    public func timeArithmDouble(iterations :Int32) :Unit{
        for(i in 0..iterations){
            arithmDouble(i)
        }
    }

    public func verify() :Bool{
        let expected :Int32 = 20600060
        return (arithmDouble(10) == expected)
    }
}

let TIME_FUNCTIONS_ITERS :Int32 = 1000

@OverflowWrapping
main() :Unit{
    var reps: Int32 = 10
    var args = Process.current.arguments
        if (args.size == 1) {
            var num = Int32.tryParse(args[0])??0
            if (num != 0) {
                reps = num
            }
        }
    let obj :Exceptions = Exceptions()
    var startTime = DateTime.now()
    var v1 = obj.timeArithmDouble(TIME_FUNCTIONS_ITERS)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verify() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }
}
