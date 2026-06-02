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

type uint = UInt16

type A = I

interface I {
    static func a(): uint {
        1
    }
}

extend uint <: A {}

type fun = (uint) -> (uint)

func b(a: uint): uint {
    a
}

func a(a: fun): fun {
    a
}

main(): Int64 {
    if (a(b)(uint.a()) == 1) {
        return 0
    } else {
        return 1
    }
}
