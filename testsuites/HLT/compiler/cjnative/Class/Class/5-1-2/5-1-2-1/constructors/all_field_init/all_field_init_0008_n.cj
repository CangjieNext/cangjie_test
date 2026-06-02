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
    public var a: Int32 = 100
    public var b: Float32
    public init() {
        a = 200
    }
}

func run(): Int64 {
    var value: Data = Data();
    var r1: Int32 = value.a
    var r2: Float32 = value.b
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_class_uninitialized_field
