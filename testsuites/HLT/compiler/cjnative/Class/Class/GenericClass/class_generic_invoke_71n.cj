/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

main(): Int64 {
    return run()
}

class Data<T> {
    public let width: T = 1
    public let length: T = 2
    public init(widthin: T, lengthin: T) {
        width = widthin
        length = lengthin
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Data = Data<Int32>(a, b)
    return 0
}
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_generic_type_without_type_argument
