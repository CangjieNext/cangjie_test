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

type ch = Rune

type A = structA

interface I {
    prop i: ch {
        get() {
            var a: ch = r'2'
            return a
        }
    }
}

interface I2 {
    prop i2: ch {
        get() {
            var a: ch = A().i
            return a
        }
    }
}

extend A <: I {
    public prop i: ch {
        get() {
            var a: ch = r'2'
            return a
        }
    }
}

extend A <: I2 {
    public prop i2: ch {
        get() {
            var a: ch = A().i
            return a
        }
    }
}

struct structA {}

struct B {
    public var a: ch
    public init() {
        this.a = A().i2
    }
}

main(): Int64 {
    if (B().a == r'2') {
        return 0
    } else {
        return 1
    }
}
