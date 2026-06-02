/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1|compare %f

struct Data {
    public let width: Int32
    public let length: Int32
    public var data: Data = Data(2, 3, "2")
    public init(x: Int32, y: Int32, str: String) {
        width = x
        length = y
    }
}

func run(): Int64 {
    var data = Data(2, 3, "1").data
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_value_type_recursive
// ASSERT: scan sema_recursive_constructor_call
