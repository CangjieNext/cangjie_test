/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f

import std.deriving.*

@Derive[ToString where T <: ToString]
struct S1 {}

@Derive[ToString where T <: ToString]
struct S2<E> {}

@Derive[ToString where T<T> <: ToString]
struct S3 {}

@Derive[ToString where T < ToString]
struct S4 {}

@Derive[where T <: ToString]
struct S5 {}

@Derive[ToString where where T <: ToString]
struct S6 {}

@Derive[ToString where T]
struct S7 {}

@Derive[ToString where]
struct S8 {}

@Derive[ToString where T<T> <: ToString , ]
struct S9 {}

main() {}

/* SCAN-IN
error: Generic parameter not found
  ==> diagnostics-generics.cj:12:24:
   | 
12 | @Derive[ToString where T <: ToString]
   |                        ^ 
   | 

error: Generic parameter not found
  ==> diagnostics-generics.cj:15:24:
   | 
15 | @Derive[ToString where T <: ToString]
   |                        ^ 
   | 

error: Generic constraint should be applied to a generic parameter without parameters
  ==> diagnostics-generics.cj:18:25:
   | 
18 | @Derive[ToString where T<T> <: ToString]
   |                         ^^^ 
   | 

error: Expected upper bound operator '<:'
  ==> diagnostics-generics.cj:21:26:
   | 
21 | @Derive[ToString where T < ToString]
   |                          ^ 
   | 

error: Expected interface name, got where
  ==> diagnostics-generics.cj:24:9:
   | 
24 | @Derive[where T <: ToString]
   |         ^^^^^ 
   | 

error: Expected generic param or interface name
  ==> diagnostics-generics.cj:27:24:
   | 
27 | @Derive[ToString where where T <: ToString]
   |                        ^^^^^ 
   | 

error: Generic parameter requires upper bounds
  ==> diagnostics-generics.cj:30:24:
   | 
30 | @Derive[ToString where T]
   |                        ^ 
   | 

error: Expected generic param or interface name
  ==> diagnostics-generics.cj:33:18:
   | 
33 | @Derive[ToString where]
   |                  ^^^^^ 
   | 

error: Generic constraint should be applied to a generic parameter without parameters
  ==> diagnostics-generics.cj:36:25:
   | 
36 | @Derive[ToString where T<T> <: ToString , ]
   |                         ^^^ 
   | 

9 errors generated, 9 errors printed.
*/

