/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: check_array.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt check_array.cj -o libcangjie-check.%middle
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -L. -lcangjie-check -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan success

import std.runtime.*
import A.*

let tmpCheck: CheckArray = CheckArray()

class Test <: TestBase {
    public var t0: Int32 = 1
    ~init() {
        tmpCheck.SetIndex(index)
    }
}

// Objective: for a blocking GC call, current GC is finished before the call returns
main(): Int64 {
    var i: Int64 = 0
    while (i < 100) {
        var index: Int64 = tmpCheck.RegisterIndex(Test())
        if (tmpCheck.CheckItem(index) == true) {
            print("fail: obj is freed before GC!")
            return 0
        }
        GC() // blocking GC expected
        sleep(Duration.millisecond * 200) // for finalizer, wait it done
        while (tmpCheck.CheckItem(index) != true) {
            continue;
        }
        i++
    }
    print("success")
    return 0
}
