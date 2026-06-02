/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

class Test {
    public init() {
        this()
    }
}

main(): Int64 {
    var test: Test = Test()
    var res1: Int32 = test.i
    print(res1.toString())
    return Int64(res1 - 2)
}
// ASSERT: scan sema_recursive_constructor_call
// ASSERT: scan sema_not_member_of
