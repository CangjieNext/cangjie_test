/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

interface I<T> {
    static func foo(a: T): Int32 {
        return Int32(1)
    }
}

interface J<T> {
    static func foo(a: T): Bool {
        return true
    }
}

public open class A<T> {}

public class B<X, Y, Z> <: A<Int32> & I<Int8> & J<Int8> {}

main() {
    var a: B<Int8, Int16, Int32> = B<Int8, Int16, Int32>()
    return 0
}
// ASSERT: scan sema_interface_member_must_be_implemented
