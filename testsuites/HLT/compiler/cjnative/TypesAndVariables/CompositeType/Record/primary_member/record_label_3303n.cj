/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return run()
}

struct Data {
    public var a: Int32
    public var b: Int32 = a
    public Data(a: Int32, b: Int32) {
    }
}

func run(): Int64 {
    var a: Int32 = 5
    var b: Int32 = 6
    let data: Data = Data(a, b)
    var res: Int32 = data.b
    return 0
}
// ASSERT: scan sema_used_before_initialization
// ASSERT: scan sema_class_uninitialized_field
