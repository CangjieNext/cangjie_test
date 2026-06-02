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
struct S {
    static let xxxx = 1

    @DeriveExclude
    static let aaaa = 2

    @DeriveInclude
    static prop bbbb: Int { get() { 1 }}
}

@Derive[ToString]
enum E {
    EA

    @DeriveInclude
    static prop cccc: String { get() { "" }}
}

/* SCAN-IN
error: DeriveExclude can't be applied to a static field because static fields are always excluded
  ==> statics.cj:17:16:
   | 
17 |     static let aaaa = 2
   |                ^^^^ 
   | 

error: DeriveInclude can't be applied on a static property
  ==> statics.cj:20:17:
   | 
20 |     static prop bbbb: Int { get() { 1 }}
   |                 ^^^^ 
   | 

error: DeriveInclude can't be applied on a static property
  ==> statics.cj:28:17:
   | 
28 |     static prop cccc: String { get() { "" }}
   |                 ^^^^ 
   | 

3 errors generated, 3 errors printed.
 */
