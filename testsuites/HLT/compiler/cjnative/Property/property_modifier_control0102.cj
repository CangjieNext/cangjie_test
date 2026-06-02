/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Foo {
    private prop a: Int64 {
        get() {
            return 0
        }
    }
    protected prop b: Int64 {
        get() {
            return 0
        }
    }
}

class Coo <: Foo {
    public var x: Int64 = 1
    public var y: Int64 = 1
    public var z: Int64 = 1
    public init() {
        super()
        x = a
    }
}

main(): Int64 {
    Coo()
    var m = Foo().b
    return 0
}
// ASSERT: scan sema_invalid_access_control
