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

type int = Int8

interface I {
    static func a(): int {
        8
    }
}

extend int <: I {}

interface interfaceA {
    func f1(): int {
        int.a()
    }
    static func f2(a: int) {
        return a.toString()
    }
}

class B <: interfaceA {}

main(): Int64 {
    if (B.f2(int.a()) == "8" && B().f1() == 8) {
        return 0
    } else {
        return 1
    }
}
