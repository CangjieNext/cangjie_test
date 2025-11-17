/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg1.cj pkg.cfg1
// EXEC-PIPE-1: %compiler %cmp_opt pkg1.cj %f -o %output 2>&1 | compare %f

package pkg1

func run(): Int64 {
    var data: Data = Data()
    if (data.get() != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_missing_entry
// ASSERT: scan sema_no_match_function_declaration_for_call
