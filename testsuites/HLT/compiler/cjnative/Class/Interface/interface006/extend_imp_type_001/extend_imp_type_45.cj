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

type int = Int64

interface I {
    func a(a: int) {
        a
    }
}

extend int <: I {}

enum enumA<T> {
    | A

    public func a(a: T) {
        a
    }
    public static func b(a: T) {
        a
    }
}

main(): Int64 {
    if (enumA<int>.b(2) == 2 && enumA<int>.A.a(5) + Int64(1).a(5) == 10) {
        return 0
    } else {
        return 1
    }
}
