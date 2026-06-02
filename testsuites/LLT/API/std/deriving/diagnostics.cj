/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f

import std.deriving.*

struct ND {
}

@Derive[aaaa]
struct Unsupported {
    @DeriveExclude
    prop e: String { get() { "" } }

    @DeriveInclude
    var m = 1
}

@Derive[ToString]
struct S {
    let unable = ND()
}

/* SCAN-IN
error: Deriving for std.core.aaaa is not supported
  ==> diagnostics.cj:15:9:
   | 
15 | @Derive[aaaa]
   |         ^^^^ 
   | 

error: DeriveExclude should be applied on a field
  ==> diagnostics.cj:18:10:
   | 
18 |     prop e: String { get() { "" } }
   |          ^ 
   | 

error: DeriveInclude should be applied on a property
  ==> diagnostics.cj:21:9:
   | 
21 |     var m = 1
   |         ^ 
   | 

error: Type for field 'unable' is unknown. Please specify its type explicitly.
  ==> diagnostics.cj:26:9:
   | 
26 |     let unable = ND()
   |         ^^^^^^ 
   | 

4 errors generated, 4 errors printed.
*/

