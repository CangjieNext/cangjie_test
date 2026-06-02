/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

main(): Int64 {
    return run()
}

class Data<T, V> {
    public var width: T
    public var length: V
    public init(widthin: T, lengthin: V) {
        width = widthin
        length = lengthin
    }
    public func area(x: T): T {
        length = x
        return width
    }
}

func run(): Int64 {
    var i1: Int32 = 3
    var i2: Int32 = 4
    let data: Data = Data<Int32>(i1, i2)
    return 0
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_generic_type_without_type_argument
// ASSERT: scan sema_generic_argument_no_match
