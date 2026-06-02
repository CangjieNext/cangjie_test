/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

open class Base<T> {
    private func foo(x: T): T {
        return x
    }
}

class Data<T> <: Base<T> {
    public init(x: T) {}
}

main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    var res: Int32 = data.foo(3)
    return 0
}
// ASSERT: scan sema_wrong_number_of_arguments
// ASSERT: scan sema_no_match_function_declaration_for_call
