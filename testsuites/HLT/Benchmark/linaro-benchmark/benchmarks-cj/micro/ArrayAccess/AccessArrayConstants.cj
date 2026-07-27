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

class AccessArrayConstants {

    private static let Range :Int32 = 100000

    public static func accessArrayConstants(array: Array<Int64>) {
        for (i in 0..Range:1) {
        array[4]+=1
        array[5]+=1
        }
    }

    public func timeAccessArrayConstants(iters: Int64) {
        let arr =[1,2,3,4,5,6,7,8,9,10]

        for (i in 0..iters:1) {
            accessArrayConstants(arr)
        }
    }
}

main():Int64{

    var reps: Int64 = 1000

    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int64.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj: AccessArrayConstants = AccessArrayConstants()

    var startTime = DateTime.now()
    obj.timeAccessArrayConstants(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)
    print(perTime.format(".2") + "ns\n")

    return 0
}
