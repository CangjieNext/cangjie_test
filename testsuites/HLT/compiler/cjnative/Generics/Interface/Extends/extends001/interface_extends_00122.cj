/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A<X> {
    operator func !(a: A<X>): Bool {
        return false
    }
}

interface B <: A {}

class C_B <: B {
    func foo(): Int32 {
        1
    }
}

interface C<X> <: A<Int32> {}

class C_C <: C<Int32> {
    func foo(): Int32 {
        2
    }
}

interface D<X> <: A<X> {}

class C_D <: D<Int32> {
    func foo(): Int32 {
        3
    }
}

interface E<X, Y> <: A<X> {}

class C_E <: E<Int32, Int32> {
    func foo(): Int32 {
        4
    }
}

main() {
    return 0
}
// ASSERT: scan sema_operator_overload_invalid_num_parameter
// ASSERT: scan sema_interface_inherit_non_interface
// ASSERT: scan sema_generic_type_without_type_argument
