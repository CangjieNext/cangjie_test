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
@Derive[Equatable] // ok
@DeriveOrder[c, b]
@DeriveOrder[c] // error
struct DoublePlacement {
    @DeriveExclude
    @DeriveExclude // error
    let a = 1

    @DeriveInclude
    @DeriveInclude // error
    prop b: Int { get() { 0 } }

    let c = 4
}

/* SCAN-IN
error: DeriveOrder should be only applied once
  ==> diagnostics-multi.cj:15:1:
   | 
15 | @DeriveOrder[c] // error
   | ^^^^^^^^^^^^ 
   | 

error: DeriveExclude can be only applied once
  ==> diagnostics-multi.cj:18:5:
   | 
18 |     @DeriveExclude // error
   |     ^^^^^^^^^^^^^^ 
   | 

error: DeriveInclude should be only applied once
  ==> diagnostics-multi.cj:22:5:
   | 
22 |     @DeriveInclude // error
   |     ^^^^^^^^^^^^^^ 
   | 

3 errors generated, 3 errors printed.
*/
