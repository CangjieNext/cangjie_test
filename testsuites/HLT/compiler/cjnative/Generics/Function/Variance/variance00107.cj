/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Father {}

class Child <: Father {}

func f1(a: Child): Father {
    return Father()
}

func f2(a: Father): Child {
    return Child()
} // f2 type is f1 type`s child type.

func assert<T>(input: T): Int32 {
    return 0
}

main(): Int64 {
    assert<(Father) -> Child>(f1)
    return 0
}
// ASSERT: scan sema_parameters_and_arguments_mismatch
// ASSERT: scan sema_no_match_function_declaration_for_ref
