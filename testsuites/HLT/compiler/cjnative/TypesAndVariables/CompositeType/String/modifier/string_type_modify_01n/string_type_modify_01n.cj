/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkgs
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs/pkgs.cj -o pkgs.%middle
// EXEC-PIPE: %compiler %cmp_opt %f %compile_lib_opt pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: scan sema_unused_import

import pkgs.string
