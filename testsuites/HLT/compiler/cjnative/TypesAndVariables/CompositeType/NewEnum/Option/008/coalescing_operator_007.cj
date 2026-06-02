/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I0<T> {
    static func f0<T>(a: T): ??T
    static func f1<T>(a: ??T): Unit
}

class C0<T> <: I0<T> {
    public static func f0<T>(a: T): ??T {
        let b: ??T = Option<Option<T>>.Some(a)
        b
    }

    public static func f1<T>(a: ??T): Unit {
        return
    }
}

main(): Int64 {
    C0<Int64>.f1<Int64>(Some(1))
    if (C0<String>.f0<String>("a\\") == "a\\" && (C0<String>.f0<String>("") is ??String)) {
        return 0
    }
    return 1
}
