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
    public var c: Int32 = 1
    public init(value: Int32) { // Expected: regex recursive constructor calling detected
        this(value)
    }
    public init() {
        this(3)
    }
}
// ASSERT: scan sema_recursive_constructor_call
