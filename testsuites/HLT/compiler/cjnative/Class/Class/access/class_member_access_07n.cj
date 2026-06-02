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
    protected var a: Int32 = 2
    public static var b: Int32 = 3
    private init(x: Int32) {
        a = x
    }
    public init(x: String) {
        a = 3
    }
    public static func foo(): Int32 {
        return a
    }
}

class GenRec <: Base {
    public let b: Int32 = 1
    public init(str: String) {
        super(3)
        this.b = super.foo() + super.b
    }
}

class Data <: Base {
    public let b: Int32 = 1
    public init(str: String) {
        super("3")
        this.b = super.foo() + super.a
    }
}

main(): Int64 {
    GenRec("hi")
    Data("hello")
    return 0
}
// ASSERT: scan sema_static_function_cannot_access_non_static_member
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_object_cannot_access_static_member
