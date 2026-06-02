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
    public var b: Int32 = 0
    public static var b2: Int32 = 0
    public func foo(): Int32 {
        return a
    }

    public static func foo1(): Int32 {
        return 0
    }
}

var test = Test()

func a(): Int32 {
    return 5
}

func run(): Int64 {
    test.b = 1
    test.foo = a
    return Int64(test.b + test.foo() - 6)
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_unqualified_left_value_assigned
