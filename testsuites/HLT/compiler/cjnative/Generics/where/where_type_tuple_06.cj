/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Aoo<T> where T <: (Unit, A) {
    public var a: T
    public init(x: T) {
        a = x
    }
}

class A <: B {
    public var a: Int64 = 1
}

open class B {
    public var b: Int64 = 2
}

main() {
    var a1 = Aoo<(Unit, A)>(((), Boo()))
    var a2 = Aoo<(Unit, B)>(((), Boo()))
    var a3 = Aoo<(Unit, A)>(((), Aoo())) // normal
    var a4 = Aoo<(Unit, B)>(((), Aoo()))
    return 0
}
// ASSERT: scan sema_parameters_and_arguments_mismatch
// ASSERT: scan sema_undeclared_identifier
// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan sema_wrong_number_of_arguments
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
