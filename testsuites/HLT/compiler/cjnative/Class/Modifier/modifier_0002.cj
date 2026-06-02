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

open class A {
    protected open func f1() {
        return 1
    }
    static func g1() {
        return 1
    }
    protected mut open prop a1: Int64 {
        get() {
            1
        }
        set(v) {
            v
        }
    }
    mut static prop b1: Int64 {
        get() {
            1
        }
        set(v) {
            v
        }
    }
}

class B <: A {
    protected override func f1() {
        return 0
    }
    static redef func g1() {
        return 0
    }
    protected mut override prop a1: Int64 {
        get() {
            0
        }
        set(v) {
            v
        }
    }
    mut static redef prop b1: Int64 {
        get() {
            0
        }
        set(v) {
            v
        }
    }
}

main() {
    var a = B()
    return a.f1() + B.g1() + a.a1 + B.b1
}
