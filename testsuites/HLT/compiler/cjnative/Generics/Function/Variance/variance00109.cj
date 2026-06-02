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

func f1(a: Child): Child {
    return Child()
}

func f2(a: Father): Father {
    return Father()
}

func assert<T>(input: T): Int32 {
    return 0
}

main(): Int64 {
    assert<(Father) -> Father>(f1)
    assert<(Child) -> Child>(f2)
    return 0
}
// ASSERT: scan sema_parameters_and_arguments_mismatch
// ASSERT: scan sema_no_match_function_declaration_for_ref
// ASSERT: scan sema_mismatched_types
