/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

class A<T> {
    private operator func ()(input: T) {}
    public func test(input: T) {
        this(input)
    }
}

main() {
    var a: A<Int64> = A<Int64>()
    a.test(1)
    return 0
}
// ASSERT: scan sema_invalid_this_call_outside_ctor
