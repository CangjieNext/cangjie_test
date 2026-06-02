/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt --error-count-limit=100 2>&1 | compare %f

import std.deriving.*

struct ND {}

@Derive[ToString]
class C {
    let a: ND = ND()
}

@Derive[Equatable]
struct S {
    let b = other()

    static func other(): ND { ND() }
}

@Derive[Comparable]
class D<E> {
    let c: ND = ND()
}

@Derive[Hashable]
class E {
    let a: ND = ND()
    let b = a
    let c = this.a
    let d = (this.c)
}

main() {}

/* SCAN-IN
error: mismatched types
  ==> diagnostics-bounds.cj:16:9:
   | 
16 |     let a: ND = ND()
   |         ^ expected 'Interface-ToString', found 'Struct-ND'
   | 

*/

/* SCAN-IN
error: mismatched types
  ==> diagnostics-bounds.cj:21:9:
   | 
21 |     let b = other()
   |         ^ expected 'Interface-Equatable<Struct-ND>', found 'Struct-ND'
   | 

*/

/* SCAN-IN
error: mismatched types
  ==> diagnostics-bounds.cj:28:9:
   | 
28 |     let c: ND = ND()
   |         ^ expected 'Interface-Comparable<Struct-ND>', found 'Struct-ND'
   | 

*/

/* SCAN-IN
error: mismatched types
  ==> diagnostics-bounds.cj:34:9:
   | 
34 |     let b = a
   |         ^ expected 'Interface-Hashable', found 'Struct-ND'
   | 

*/

/* SCAN-IN
error: mismatched types
  ==> diagnostics-bounds.cj:35:9:
   | 
35 |     let c = this.a
   |         ^ expected 'Interface-Hashable', found 'Struct-ND'
   | 

*/

/* SCAN-IN
error: mismatched types
  ==> diagnostics-bounds.cj:36:9:
   | 
36 |     let d = (this.c)
   |         ^ expected 'Interface-Hashable', found 'Struct-ND'
   | 

*/

