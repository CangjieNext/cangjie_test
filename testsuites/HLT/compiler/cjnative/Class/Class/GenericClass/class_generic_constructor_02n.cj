/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base<T> {
    public var a: Int32 = 1
}

class Data<T> <: Base<Int32> {
    public var f: T
    public init() {}
}

func run(): Int64 {
    var data: Data<Int64> = Data<Int64>()
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_class_uninitialized_field
