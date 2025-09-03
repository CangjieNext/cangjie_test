/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package tmp_test

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 111
// ASSERT: scan holder init end

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.runtime.*

public class Holder {
    private let p = LibC.malloc<Int64>(count: 1)
    public init() {
        unsafe {
            p.write(111)
        }
        let value = unsafe {
            p.read()
        }
        println(value)
        println("holder init end")
    }
    ~init() {
        unsafe {
            LibC.free(this.p)
        }
    }
    public func doSomeThing(): Unit {
        let p0 = this.p
        for (_ in 0..100000) {
            let value = unsafe {
                p0.read()
            }
        }
        blackBox(this)
    }
}

main(): Int64 {
    let holder = Holder()
    holder.doSomeThing()
    return 0
}
