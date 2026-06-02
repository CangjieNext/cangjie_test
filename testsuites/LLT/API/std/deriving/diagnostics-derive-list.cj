/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt --error-count-limit=100 2>&1 | compare %f

import std.deriving.*

@Derive[ToString + Equatable]
class C {}

@Derive[ToString Equatable]
class D {}

@Derive[where]
class E {}

@Derive[+]
class F {}

@Derive[ToString.+]
class G {}

@Derive[ToString.+ where]
class H {}

@Derive[ToString where T <: +]
class I<T> {}

@Derive[ToString where T <: std.core.+]
class J<T> {}

@Derive[ToString where T <: X<Y<Z>>] // should be no error
class K<T> {}

@Derive[]
struct Empty {}

main() {}

/* SCAN-IN
error: Expected comma got + (ADD)
  ==> diagnostics-derive-list.cj:12:18:
   | 
12 | @Derive[ToString + Equatable]
   |                  ^ 
   | 

error: Expected comma got Equatable (IDENTIFIER)
  ==> diagnostics-derive-list.cj:15:18:
   | 
15 | @Derive[ToString Equatable]
   |                  ^^^^^^^^^ 
   | 

error: Expected interface name, got where
  ==> diagnostics-derive-list.cj:18:9:
   | 
18 | @Derive[where]
   |         ^^^^^ 
   | 

error: Expected interface name, got +
  ==> diagnostics-derive-list.cj:21:9:
   | 
21 | @Derive[+]
   |         ^ 
   | 

error: Expected interface name
  ==> diagnostics-derive-list.cj:24:17:
   | 
24 | @Derive[ToString.+]
   |                 ^^ 
   | 

error: Expected interface name
  ==> diagnostics-derive-list.cj:27:17:
   | 
27 | @Derive[ToString.+ where]
   |                 ^^ 
   | 

error: Generic parameter requires upper bounds
  ==> diagnostics-derive-list.cj:30:24:
   | 
30 | @Derive[ToString where T <: +]
   |                        ^ 
   | 

error: Unexpected token while parsing type
  ==> diagnostics-derive-list.cj:30:29:
   | 
30 | @Derive[ToString where T <: +]
   |                             ^ 
   | 

error: Expected type identifier
  ==> diagnostics-derive-list.cj:33:38:
   | 
33 | @Derive[ToString where T <: std.core.+]
   |                                      ^ 
   | 

9 errors generated, 9 errors printed.
*/

