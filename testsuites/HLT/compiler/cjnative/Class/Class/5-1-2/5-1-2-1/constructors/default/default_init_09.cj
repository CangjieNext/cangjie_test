/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

open class Base<T> {
    init(a: Bool) {
    }
}

class Data <: Base<Int32> {
    public var a: Int64 = 5
}

func run(): Int64 {
    var value: Data = Data()
    return value.a - 5
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_no_non_param_constructor_in_super_class
