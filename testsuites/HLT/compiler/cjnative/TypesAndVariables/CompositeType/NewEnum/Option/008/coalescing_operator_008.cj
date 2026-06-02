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

class C0<T, U> {
    static func f0<T, U>(a: T, b: ??U): ??T {
        let c: ??T = Option<Option<T>>.Some(a)
        c
    }

    static func f1<T, U>(a: ??T, b: U): Unit {
        let c = a ?? None
        return
    }

    func f3<T, U>(a: ??T, b: ??U) {
        (a ?? None, b ?? None)
    }
}

main(): Int64 {
    let c0 = C0<String, Int64>()
    C0<String, Int64>.f0("", Some(1))
    C0<String, Int64>.f1(Some(""), 1)
    c0.f3<String, Int64>(Some(""), Some(1))
    if (C0<String, Int64>.f0("仓颉", Some(1)) == "仓颉" && c0.f3<String, Int64>(Some("a123"), Some(1)) == ("a123", 1)) {
        return 0
    }
    return 1
}
