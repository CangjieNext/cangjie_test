/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg1.cj
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt pkg1.cj %f -o %n.%middle 2>&1 | compare %f

package pkg1

class Data <: Base {
    public func get(): Int32 {
        return 2
    }
}
// ASSERT: scan sema_non_inheritable_super_class
// ASSERT: scan sema_cannot_override
