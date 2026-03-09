/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {
    public var a: Int32 = 100
    public var b: Float32 = 10.0
}

class Data <: Base {
    public var c: Int32 = 1
    public var d: Int32 = 2
    public var e: Int32 = 3
    public init(value1: Int32, value2: Int32) {
        this(value1)
    }

    public init(value1: Int32) {
        this(value1, 4)
    }
    public init() {
        this(3)
    }
}

func run(): Int64 {
    var c: Data = Data()
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_recursive_constructor_call
