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
    public init() {
    }
}

class Test <: Base {
    public Test(a!: Test = Test()) {
    }
}

class Test1 <: Base {
    public init(a!: Test1 = Test1()) {
    }
}

class Test2 <: Base {
    public init(a!: Test2 = this()) {
    }
}

main(): Int64 {
    var test: Test = Test()
    return 0
}
// ASSERT: scan sema_recursive_constructor_call
// ASSERT: scan sema_illegal_place_of_calling_this_or_super
