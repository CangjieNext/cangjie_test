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

open interface A {
    func f1() {
        return 1
    }
    func f2(): Int64
    static func g1() {
        return 1
    }
    static func g2(): Int64
    mut prop a1: Int64 {
        get() {
            1
        }
        set(v) {
            v
        }
    }
    mut prop a2: Int64
    mut static prop b1: Int64 {
        get() {
            1
        }
        set(v) {
            v
        }
    }
    mut static prop b2: Int64
}

struct B <: A {
    public override func f1() {
        return 0
    }
    public override func f2(): Int64 {
        return 0
    }
    public static redef func g1() {
        return 0
    }
    public static redef func g2(): Int64 {
        return 0
    }
    public mut override prop a1: Int64 {
        get() {
            0
        }
        set(v) {
            v
        }
    }
    public mut override prop a2: Int64 {
        get() {
            0
        }
        set(v) {
            v
        }
    }
    public mut static redef prop b1: Int64 {
        get() {
            0
        }
        set(v) {
            v
        }
    }
    public mut static redef prop b2: Int64 {
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
    return a.f1() + B.g1() + a.f2() + B.g2() + a.a1 + a.a2 + B.b1 + B.b2
}
