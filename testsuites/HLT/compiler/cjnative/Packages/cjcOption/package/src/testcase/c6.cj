/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../testcase
// EXEC: %compiler %cmp_opt %compile_lib_opt  testcase/b/b1.cj -o b1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt  testcase/b/b2.cj -o b2.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt  %f b1.%middle b2.%middle  -o ./out.%middle 2>&1 | compare %f

package testcase

import testcase.b.*

var c1 = b1
var c2 = b2
// ASSERT: scan sema_undeclared_identifier
