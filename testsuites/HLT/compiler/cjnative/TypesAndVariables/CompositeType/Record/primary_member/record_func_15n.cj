/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

main(): Int64 {
    return run()
}

struct Data<T> {
    let width: T
    let length: T

    Data(x: T, y: T) {
        width = x
        length = y
    }

    operator func -(operand: Data): Data<Int32> {
        var width: Int64 = 3
        var length: Int64 = 4
        Data<Int32>(width, length)
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    var data: Data<Int32> = Data<Int32>(a, b)
    var d1: Data<Int32> = -data
    var res1: Int32 = d1.width
    var res2: Int32 = d1.length
    return 0
}
// ASSERT: scan sema_generic_type_without_type_argument
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_invalid_unary_expr
