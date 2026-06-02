/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base<T> {
    public var base: T
    public init(x: T) {
        base = x
    }
}

class Data<T> <: Base<Int32> {
    public static var f: () -> T // 
    public var b: T
    public init(input: T) {
        b = input
        f = foo
    }
    public static func foo(): T {
        return b
    }
}

main(): Int64 {
    var i1: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i1)
    var res = Data<Int32>.f
    if (res == 4) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_type_uninitialized_static_field
// ASSERT: scan sema_no_non_param_constructor_in_super_class
// ASSERT: scan sema_static_function_cannot_access_non_static_member
// ASSERT: scan sema_invalid_binary_expr
