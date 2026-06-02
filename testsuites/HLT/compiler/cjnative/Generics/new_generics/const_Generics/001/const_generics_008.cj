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

class C<T, U> {
    static const a: String = ""
    static const func GetC() {
        None<T>
    }
    let d = 0

    const init(a: T, b: U) {
    }
}

main(): Int64 {
    const c0 = C<Int64, String>(0, "")
    C<Int64, String>.a
    C<Int64, String>.GetC()
    c0.d
    if (C<Int64, String>.a == "" && C<Int64, String>.GetC().isNone() && c0.d == 0) {
        return 0
    }
    return 1
}
