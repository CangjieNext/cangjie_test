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

interface A {
    open func f1() {
        return 1
    }
    open func f2(): Int64
    static func g1() {
        return 1
    }
    static func g2(): Int64
    open prop a1: Int64 {
        get() {
            1
        }
    }
    open prop a2: Int64
    static prop b1: Int64 {
        get() {
            1
        }
    }
    static prop b2: Int64
}

enum B <: A {
    E

    public func f1() {
        return 0
    }
    public func f2(): Int64 {
        return 0
    }
    public static func g1() {
        return 0
    }
    public static func g2(): Int64 {
        return 0
    }
    public prop a1: Int64 {
        get() {
            0
        }
    }
    public prop a2: Int64 {
        get() {
            0
        }
    }
    public static prop b1: Int64 {
        get() {
            0
        }
    }
    public static prop b2: Int64 {
        get() {
            0
        }
    }
}

main() {
    var a = E
    return a.f1() + B.g1() + a.f2() + B.g2() + a.a1 + a.a2 + B.b1 + B.b2
}
