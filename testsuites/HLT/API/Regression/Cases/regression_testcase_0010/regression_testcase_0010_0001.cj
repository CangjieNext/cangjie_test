/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import std.sync.*
import std.time.*
import std.convert.*
import std.collection.*

var reps: Int64 = 179

func benchmarkCreateRoutines(procs: Int64) {
    let f: (Int64) -> Unit
    f = {
        n: Int64 => try {
            if (n == 0) {
                return
            }
            var res = spawn {
                => f(n - 1)
            }
            res.get()
            return
        } catch (e: Exception) {
            print(e)
            ()
        }
    }

    let arr: ArrayList<Future<Unit>> = ArrayList<Future<Unit>>(procs, {
        i: Int64 => spawn {
            => f(reps / procs)
        }
    })

    for (i in 0..procs) {
        arr[i].get()
    }
}

main(): Int64 {
    var startTime: DateTime
    var endTime: DateTime
    var perTime: Float64

    startTime = DateTime.now()
    benchmarkCreateRoutines(1)
    endTime = DateTime.now()
    perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    print(perTime.format(".2") + " ns/op\n")

    return 0
}
// ASSERT: scan sema_capture_before_initialization
