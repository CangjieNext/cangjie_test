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

class C<T, U> {
    static const a: String = ""
    static const func GetC() {
        None<T>
    }
    let d = 0

    init() {
    }
}

main(): Int64 {
    const c0 = C<Int64, String>()
    C<Int64, String>.a
    C<Int64, String>.GetC()
    return 0
}
