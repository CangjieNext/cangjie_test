/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Father {}

class Child <: Father {}

interface I<T> {
    func foo(a: T): Father
}

interface J<T> {
    func foo(a: T): Child
}

public open class A<T> {}

public class B<X, Y, Z> <: A<Int32> & I<Int8> & J<Int16> {
    func foo(a: Int16): Father {
        return Child()
    }
}

main() {
    var a: B<Int8, Int16, Int32> = B<Int8, Int16, Int32>()
    return 0
}
// ASSERT: scan sema_class_need_abstract_modifier_or_func_need_impl
// ASSERT: scan sema_return_type_incompatible
