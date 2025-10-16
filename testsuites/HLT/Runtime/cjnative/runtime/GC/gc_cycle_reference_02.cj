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

open class Father <: TestBase {
    public var a0: Int64 = 0
}

class Son <: Father {
    public init(i: Int64) {
        this.a0 = i
    }

    public func create_cycle(son2: Son) {
        this.f = son2
        son2.f = this
    }

    public var f: Father = Father()

    ~init() {
        tmpCheck.SetIndex(index)
    }
}

// Objective: GC is able to reclaim the cycle objs
main(): Int64 {
    unsafe {
        var son1: Son = Son(1)
        var son2: Son = Son(100)
        son1.create_cycle(son2) // son1 -> son2, son2 -> son1
        if (son1.f.a0 != Int64(100)) {
            print("fail: son1.f.a0 is not 100!")
            return 0
        }
        if (son2.f.a0 != Int64(1)) {
            print("fail: son2.f.a0 is not 1!")
            return 0
        }

        tmpCheck.RegisterIndex(son1)
        tmpCheck.RegisterIndex(son2)

        // make cycle isolated
        son1 = Son(0)
        son2 = Son(0)
        // trigger gc
        GC()
        sleep(Duration.millisecond * 2000) // for non-blocking gc, wait it done

        // cycle objs are expected to be reclaimed
        if (tmpCheck.Check() != true) {
            print("fail: watched objs are not freed by GC!")
        } else {
            print("success")
        }
        return 0
    }
}
