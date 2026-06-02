/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Base<T> {
    init(x: T) {}
    protected open func foo(x: T): String {
        return "Father"
    }
}

class Data<T> <: Base<T> {
    init(input: T) {}
    protected override func foo(x!: T = 4): String {
        return "Child"
    }
}

main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    var res: String = data.foo(3)
    if (res == "Child") {
        return 0
    }
    return 1
}
// ASSERT: scan sema_no_non_param_constructor_in_super_class
// ASSERT: scan sema_param_named_mismatched
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_wrong_number_of_arguments
// ASSERT: scan sema_need_named_argument
