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

type bo = Bool

interface I {
    static func a() {
        true
    }
}

extend bo <: I {}

interface interfaceA<T> {
    func f1(a: T): T {
        a
    }
    static func f2(a: T) {
        return a
    }
}

class B <: interfaceA<Bool> {}

main(): Int64 {
    if (B.f2(bo.a()).toString() == "true" && B().f1(true)) {
        return 0
    } else {
        return 1
    }
}
