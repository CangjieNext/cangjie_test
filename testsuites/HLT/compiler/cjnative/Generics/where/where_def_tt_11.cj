/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Aoo<T> where T <: (T) -> T {
    public var a: T
    public init(x: T) {
        a = x
    }
}

func foo<T>(x: T): T {
    return x
}

main() {
    var a = Aoo<(Int64) -> Int64>(foo)
    if (a(1) != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_generic_param_exist_in_class_irrelevant_upperbound_recursively
// ASSERT: scan sema_generic_type_argument_not_match_constraint
