// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: a/a.cj
// EXEC-0: %compiler %noColor a/a.cj --output-type=staticlib
package A

public class Moo {}


// SEPARATE-FILE: b/b.cj
// EXEC-0: %compiler %noColor b/b.cj --output-type=staticlib
package B

public class Moo {}


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj libA.a --output-type=chir --output-dir ./c
package cmp

import A

class Foo<M, N> {
}

common extend<T> Foo<T, A.Moo> where T <: ToString {}


// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo libB.a --output-type=dylib --output-dir ./p 2>&1 | compare %f

package cmp

import B

specific extend<T> Foo<T, B.Moo> where T <: ToString {}

/* SCAN
error: 'specific' extend 'Foo<T,Moo>' can not find 'common' match
 ==> p/p.cj:7:10:
  | 
7 | specific extend<T> Foo<T, B.Moo> where T <: ToString {}
  |          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
