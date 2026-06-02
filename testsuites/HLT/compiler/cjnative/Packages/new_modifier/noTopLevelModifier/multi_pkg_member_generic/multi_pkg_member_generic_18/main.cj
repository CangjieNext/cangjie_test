/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: A
// EXEC:  %compiler %cmp_opt %compile_lib_opt ./A/A.cj -o b.%middle 
// EXEC:  %compiler %cmp_opt %compile_lib_opt b.%middle ./A/a/a.cj -o a.%middle 

// ERRCHECK:  %compiler %cmp_opt a.%middle b.%middle %f -o %output
// ASSERT: scan sema_no_match_function_declaration_for_call

import A.a.*

main() {
    return test.test1(1)
}
