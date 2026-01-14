// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
 
// LEVEL: 1 
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

interface Sup {}
interface I <: Sup {}
type AL = Sup

interface Rec<T> {}

common func f1<T>(): Int where T <: I { 1 } 
common func f2<T>(): Int where T <: I { 2 } 
common func f22<T>(): Int where T <: I { 2 } 
common func f3<T>(): Int where T <: Rec<T>  { 3 }
common func f4<T>(): Int where T <: Rec<T>  { 4 }
 
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

specific func f1<T>(): Int where T <: I { 11 }
specific func f2<X>(): Int where X <: Sup { 22 }
specific func f22<X>(): Int where X <: AL { 222 }
specific func f3<R>(): Int where R <: Rec<R> { 33 }
specific func f4<Z>(): Int { 44 }

struct S <: Rec<S> {}
 
main() {
    println(f1<I>())
    println(f2<Sup>())
    println(f22<AL>())
    println(f22<Sup>())
    println(f3<S>()) 
    println(f4<S>())
    println(f4<Int>())
}
 
/* SCAN
11
22
222
222
33
44
44
*/
