/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 4个/1个入参
class A {
    public var a: Int64
    public var b: Int64
    public init(x: Int64) {
        a = x
        b = x
    }
    public operator func [](index: Int64, value!: Int64, value2!: Int64): Unit {
        this.b = value
    }
    public operator func [](): Unit {
    }
}

main(): Int64 {
    var a = A(2)
    return 0
}
// ASSERT: scan sema_invalid_subscript_assign_parameter
// ASSERT: scan sema_operator_overload_invalid_num_parameter
