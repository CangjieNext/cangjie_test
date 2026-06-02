/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f

import std.deriving.*

@Derive[ToString]
@DeriveOrder[m, p, n]
struct NonExistingField {
    var m = 7
    var n = 8
}

main() {}

/* SCAN-IN
error: 'p' is not a member of struct 'NonExistingField'
  ==> diagnostics-order-1.cj:13:17:
   | 
13 | @DeriveOrder[m, p, n]
   |                 ^ 
   | 
*/
