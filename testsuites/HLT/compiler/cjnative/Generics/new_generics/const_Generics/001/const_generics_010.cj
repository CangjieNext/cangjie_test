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
    static const d: VArray<Int64, $2> = VArray<Int64, $2>({x => x + 1})

    const init(a: T, b: U) {
    }
}

main(): Int64 {
    const c0 = C<Int64, String>(0, "")
    return 0
}
