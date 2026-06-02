/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: 404.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt 404.cj -o 404.%middle
// ERRCHECK: %compiler %cmp_opt %f 404.%middle -o %output

import test404.*

func test() {
    A<Int64, Int64>.test(1, 1, 1)
    B<Int64, Int64>.test(1, 1, 1)
    C<Int64, Int64>.test(1, 1, 1)
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
// ASSERT: scan sema_ambiguous_match
// ASSERT: scan sema_no_match_function_declaration_for_call
