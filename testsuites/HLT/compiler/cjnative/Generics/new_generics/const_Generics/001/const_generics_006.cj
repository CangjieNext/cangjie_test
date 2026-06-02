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

struct C<T> {
    static const a: String = "1"
    var b: ?T = None<T>
    static const func GetC() {
        None<T>
    }
    const init() {
    }
}

main(): Int64 {
    const c0 = C<Int64>()
    C<String>.a
    c0.b
    C<Byte>.GetC()
    if (C<String>.a == "1" && c0.b.isNone() && C<Byte>.GetC().isNone()) {
        return 0
    }
    return 1
}
