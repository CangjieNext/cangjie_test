/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return run();
}

struct Data {
    public static func foo1(): Int32 {
        return 1
    }
    public var a0: Int32 = 1
    public var a1: Int32 = foo1()
    public var a2: Int32 = foo2()
    public let a3: Int32 = a0
    public static var a4: Int32 = 2
    public static var a5: Int32 = a3
    public static func foo2(): Int32 {
        return a4
    }
    public static func foo3(): Int32 {
        return a3
    }
    public func foo4(): Int32 {
        return a4
    }
    public var x: Int32 = 1
    public var y: Int32 = 1
}

func run(): Int64 {
    var a0: Int32 = 1;
    var A0: Int32 = 2
    var a: Data = Data()
    var b: Data = a
    var c = b.a1
    var d = Data.foo2()
    if (c != 1 || d != 3) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_static_variable_cannot_access_non_static_member
// ASSERT: scan sema_used_before_initialization
// ASSERT: scan sema_static_function_cannot_access_non_static_member
