/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

main(): Int64 {
    if (A<String>.a != "123") {
        return 1
    }
    if (B<String>().a != "123") {
        return 2
    }
    if (C<Base>().a != "abc") {
        return 2
    }
    return 0
}

class B<T> where T <: String {
    public var b: String = ""
    public var arr1 = ["1", "23"]
    public prop a: String {
        get() {
            return T.join(arr1)
        }
    }
}

class A<T> where T <: String {
    public static var b: String = ""
    public static var arr1 = ["1", "23"]
    public static prop a: String {
        get() {
            return T.join(arr1)
        }
    }
}

class C<T> where T <: Base {
    public prop a: String {
        get() {
            return T.foo()
        }
    }
}

open class Base {
    public static func foo() {
        return "abc"
    }
}
