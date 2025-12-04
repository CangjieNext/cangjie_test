// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common sealed abstract class A {}
common open class C<:A {}

// SEPARATE-FILE: p.cj
// EXEC-0: %compiler %noColor --experimental p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output  2>&1 | compare %f
package cmp

platform sealed abstract class A {}
open class D<:A {}

main(): Unit {
 0
}

/* SCAN
error: cannot inherit common-defined 'sealed' class 'A'
 ==> p.cj:5:12:
  | 
5 | open class D<:A {}
  |            ^  ~ sealed class declared in common package part
  | 

1 error generated, 1 error printed.
*/
