/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var a: A<String> = A<String>()
    return 0
}

open class A<T> {
    public var x: T
    public open func foo() {
        return 1
    }
    public init(x: T) {
        this.x = x
        var a = foo()
    }
}
// ASSERT: scan sema_wrong_number_of_arguments
// ASSERT: scan sema_illegal_member_used_in_open_constructor
