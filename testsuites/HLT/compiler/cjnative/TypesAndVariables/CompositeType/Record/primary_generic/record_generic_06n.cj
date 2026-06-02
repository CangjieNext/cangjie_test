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
    Data(widthin: T, lengthin: Int64) {
        width = widthin
        length = lengthin
    }
    func area(): T {
        return width
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Data = Data<Int32>(a, b)
    return 0
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_generic_type_without_type_argument
