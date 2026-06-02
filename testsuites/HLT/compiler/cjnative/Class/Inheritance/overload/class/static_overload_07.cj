/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Base {
    public func foo() {
        return 1
    }
}

class Data <: Base {
    public func foo(a: Int64) {
        return a
    }

    public func foo(a: Int64, b: Bool, c!: Bool = true) {
        if (b) {
            return 1
        } else {
            return a
        }
    }

    public func inside() {
        return foo() + foo(2) + foo(0, true)
    }
}

main(): Int64 {
    var res1: Int64 = Data().foo()
    var res2: Int64 = Data().foo(2)
    var res3: Int64 = Data().foo(0, true)
    var res4: Int64 = Data().inside()
    if (res1 != 1 || res2 != 2 || res3 != 1 || res4 != 4) {
        return 1
    }
    return 0
}
