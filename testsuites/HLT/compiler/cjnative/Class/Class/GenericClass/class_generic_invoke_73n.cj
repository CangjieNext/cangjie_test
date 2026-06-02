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
    public let width: T
    public init(widthin: T) {
        width = widthin
    }
}

func run(): Int64 {
    var str: String = "string"
    let data: Data<Int32> = Data<Int32>(str)
    return 0
}
// ASSERT: scan sema_mismatched_types
