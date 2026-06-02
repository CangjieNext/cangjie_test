/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

open class Base {
    public var b: Int32 = 6
    private init() {
        this.b = 5
    }
}

class Test <: Base {
    public var a: Int32 = 3
    public Test() {
        this.a == a
    }

    public init(x: Int32) {
        super.b = x
        this.a = x
    }
}

main(): Int64 {
    var test = Test()
    var test2 = Test(8)
    if (test.b == 5 && test.a == 3 && test2.a == 8 && test2.b == 8) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_no_non_param_constructor_in_super_class
