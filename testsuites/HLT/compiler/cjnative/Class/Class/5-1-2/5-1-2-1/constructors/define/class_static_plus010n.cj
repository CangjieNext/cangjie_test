/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

main(): Int64 {
    return run()
}

class Data {
    public static let width: Int32
    public static let length: Int32
    public init(x: Int32, y: Int32) {
        width = x
        length = y
    }
}

func run(): Int64 {
    var data: Data = Data(3, 4)
    return 0
}
// ASSERT: scan sema_type_uninitialized_static_field
