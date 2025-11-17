/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg1.cj pkg.cfg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt  %f -o %n.%middle 2>&1 | compare %f

package pkg2

import pkg1

func run(): Int64 {
    var data: pkg1.Data = pkg1.Data()
    if (data.get() != 1) {
        return 1
    }
    return 0
}
// (not CJNATIVE) ASSERT: scan sema_no_match_function_declaration_for_call
// (CJNATIVE) ASSERT: scan sema_not_member_of
