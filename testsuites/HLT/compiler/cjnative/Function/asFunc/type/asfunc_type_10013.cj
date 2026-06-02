/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct A<T> {
    private operator func ()(input: T) {}
    public func test(input: T) {
        var a: A<T> = A<T>()
        a(input)
    }
}

main() {
    var a: A<Int64> = A<Int64>()
    a(1)
    return 0
}
// ASSERT: scan sema_no_match_operator_function_call
