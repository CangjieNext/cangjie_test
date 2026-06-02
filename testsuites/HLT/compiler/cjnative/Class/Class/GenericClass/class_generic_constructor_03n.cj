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
    public var a: T
    public init(x: T) {
        a = x
    }
}

class Data<T> <: Base<Int32> {
    public var f: T
    public init() {
        f = 2
    }
}

func run(): Int64 {
    var i1: Int64 = 4
    var data: Data<Int64> = Data<Int64>(i1)
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_no_non_param_constructor_in_super_class
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_wrong_number_of_arguments
