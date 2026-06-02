/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1| compare %f

open class Base<T> {
    public var base: T
    public init(x: T) {
        base = x
    }
}

func foo<T>(x: T): T {
    return x
}

class Data<T> <: Base<T> {
    public static var f: (T) -> T
    public init() {
        f = foo<T>
    }
}

main(): Int64 {
    var i1: Int32 = 3
    var data: Data<Int32> = Data<Int32>()
    var res: Int32 = Data<Int32>.f(i1)
    if (res == 3) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_type_uninitialized_static_field
// ASSERT: scan sema_no_non_param_constructor_in_super_class
