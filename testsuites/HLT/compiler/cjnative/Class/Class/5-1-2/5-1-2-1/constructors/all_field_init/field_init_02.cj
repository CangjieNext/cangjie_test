/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

class Data1<T> {
    public let f: T
}

class Data2 {
    public var a: Int32
    public let b: Int32 = 12
    public let b1: Array<Int32>
    public let b2: Data2

    public init() {
        b = 13
    }
}

func run(): Int64 {
    var value: Data1<Int64> = Data1<Int64>();
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_cannot_assign_to_immutable
