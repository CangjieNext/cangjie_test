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

type TI = I

interface I {
    static func a(): Int8 {
        8
    }
}

extend Int8 <: TI {}

interface interfaceA {
    func f1(): Int8 {
        Int8.a()
    }
    static func f2(a: Int8) {
        return a.toString()
    }
}

class B <: interfaceA {}

main(): Int64 {
    if (B.f2(Int8.a()) == "8" && B().f1() == 8) {
        return 0
    } else {
        return 1
    }
}
