/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Data<T> where T <: Int64 {
    public var classFoo: T
    public init(x: T) {
        classFoo = x
    }
}

main(): Int64 {
    let data = Data<Int32>(2)
    return 0
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
