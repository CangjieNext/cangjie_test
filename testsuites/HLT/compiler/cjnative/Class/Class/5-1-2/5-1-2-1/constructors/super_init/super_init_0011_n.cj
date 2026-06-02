/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

open class Base {
    public var a: Int32 = 100
    public var b: Float32 = 10.0
}

class Data <: Base {
    public var c: Int32
    public var d: Int32
    public var e: Int32
    public init(value1: Int32, value2: Int32) {
        this(value1)
        c = 1
        d = 2
    }

    public init(value1: Int32) {
        this(value1, 4)
    }

    public init() {
        this(3)
    }
}

func run(): Int64 {
    var res: Data = Data()
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_recursive_constructor_call
