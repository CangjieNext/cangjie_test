/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {
    public func f(a: T, b!: Int64 = 1): Int64 {
        1
    } //f1
    public func f(a: T): Int64 {
        2
    } //f2
    public func test(input: T) {
        f(input)
    }
}

main() {
    1
}
// ASSERT: scan sema_ambiguous_match
