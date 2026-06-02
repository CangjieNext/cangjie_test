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

class Data<T> {
    public var width: T
    public init(widthin: T) {
        var i: Int32 = 32
        width = i
    }
}

func run(): Int64 {
    var a: Int32 = 3
    let data: Data = Data<Int32>(a)
    return 0
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_generic_type_without_type_argument
