/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

var res1 = "a" != 'a'
var res2 = "1" != 1
var res3 = "1.2" != 1.2
var res4 = "true" != true
var res5 = "false" != false
var res6 = "()" != ()
// ASSERT: scan sema_invalid_binary_expr
