/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

struct Test {
    public let a: Int32 = 0
    public func foo(): Int32 {
        return 0
    }

    public static func foo1(): Int32 {
        return 0
    }
}

var test = Test()

func a(): Int32 {
    return 5
}

class A {
    public func foo(): Int32 {
        return 1
    }

    public static func foo1(): Int32 {
        return 0
    }
}

var testA = A()

func run(): Int64 {
    test.a = 1
    test.foo = a
    Test.foo1 = a
    testA.foo = a
    A.foo1 = a
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_unqualified_left_value_assigned
