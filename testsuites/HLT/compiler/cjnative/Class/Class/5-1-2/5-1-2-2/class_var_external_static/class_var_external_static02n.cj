/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %n.%middle 2>&1 | compare %f

package class_var_public_static

import pkg

let b = pkg.Data().a
// ASSERT: scan sema_object_cannot_access_static_member
