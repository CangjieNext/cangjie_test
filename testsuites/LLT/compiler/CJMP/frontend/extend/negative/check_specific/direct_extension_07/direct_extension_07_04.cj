// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common func foo<T>(x:T):Unit
common func foo<M, N>(m:M, n:N):Unit


// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp

platform func foo<T>(x:T):Unit {}
platform func foo<M, N>(m:M, n:N):Unit where M <: ToString {}

/*SCAN
error: 'platform' function 'foo' can not find 'common' match
 ==> p/p.cj:5:1:
  | 
5 | platform func foo<M, N>(m:M, n:N):Unit where M <: ToString {}
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

error: 'common' function 'foo' can not find 'platform' match
 ==> c/c.cj:9:1:

2 errors generated, 2 errors printed.
*/
