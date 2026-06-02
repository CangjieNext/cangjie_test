/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: a
// EXEC: %compiler %cmp_opt %compile_lib_opt a/pkga.cj -o pkga.%middle
// ERRCHECK: %compiler %cmp_opt %f pkga.%middle -o %output

import a.*

main() {
    Test().a
    Test.b
    Test().foo()
    Test.fooB()
    Test().pA
    Test.pB

    return 1
}
// ASSERT: scan sema_invalid_access_control
// ASSERT: scan sema_no_match_function_declaration_for_call
