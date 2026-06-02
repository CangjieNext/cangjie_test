/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

class Data {
    public var a: Int32 = 0
    public let b: Int32 = 0

    public let b1: Array<Int32> = Array<Int32>()
    public let b2: List<Int32> = 0

    public let b3: Data = Data()
}

func run(): Int64 {
    var value: Data = Data();
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_undeclared_type_name
// ASSERT: scan sema_recursive_constructor_call
