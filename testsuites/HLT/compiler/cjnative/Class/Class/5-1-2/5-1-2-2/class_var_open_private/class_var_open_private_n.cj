/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg.cj
// EXEC-PIPE-1: %compiler %cmp_opt pkg.cj %f -o %output 2>&1 | compare %f

package class_var_open_private

class Data <: Base {
    public var res: Int64 = one
}
// (not iOS) ASSERT: scan sema_missing_entry
// ASSERT: scan sema_undeclared_identifier
