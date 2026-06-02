/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expected 'const' expression guaranteed to be evaluated at compile time

struct C<T> {
    static const a: String = ""
    var b: ?T = None<T>
    static const func GetC() {
        None<T>
    }
    init() {
    }
}

main(): Int64 {
    const c0 = C<Int64>()
    C<String>.a
    c0.b
    C<Byte>.GetC()
    return 0
}
