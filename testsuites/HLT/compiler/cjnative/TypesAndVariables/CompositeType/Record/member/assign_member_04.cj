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
    public func foo(): Int32 {
        return 0
    }

    public static func foo1(): Int32 {
        return 0
    }
}

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

func run(): Int64 {
    var test = Test()
    var testA = A()

    test.foo = a
    Test.foo1 = a
    testA.foo = a
    A.foo1 = a
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_unqualified_left_value_assigned
