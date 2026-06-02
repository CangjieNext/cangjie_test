/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Data<T> {
    public let width: T
    public init(x: T) {
        width = x
    }
}

enum Time<T> where T <: Data<T> {
    Day(T)
}

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>(4)
    var time = Time<Data<Int32>>.Day(data)
    var res: Int32 = match (time) {
        case Day(x) => x.width
    }
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_generic_param_exist_in_class_irrelevant_upperbound_recursively
// ASSERT: scan sema_generic_type_argument_not_match_constraint
