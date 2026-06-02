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

extend A <: I {
    public static func b() {
        r'1'
    }
}

interface I {
    static func b() {
        r'1'
    }
}

struct structA {
    public var a: ch
    public structA() {
        this.a = r'2'
    }
}

main(): Int64 {
    if (A().a == r'2' && A.b() == r'1') {
        return 0
    } else {
        return 1
    }
}
