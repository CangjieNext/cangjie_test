/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum Time {
    Day(Int32, Int64)

    public func foo(x: Int64) {
        return 0
    }
    public static func bar(x: Int64) {
        0
    }
    public operator func +(right: Int64): Int64 {
        return this.foo(1) + right
    }
}

main(): Int64 {
    Time.Day(2)
    Time.Day(2, 3).foo()
    Time.bar()
    Time.Day(2) + 6
    return 0
}
// ASSERT: scan sema_wrong_number_of_arguments
