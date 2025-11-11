// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
 
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

interface SuperI {}
interface I <: SuperI {}
 
common class A<T> {}

common class B<T> {
    common func f(item: T): T {
        println("should never appear")
        return item
    }
    func f2(item: T) { f(item) }
}

common class C<T> where T <: I {} 
common class D<T> where T <: I {} 
 
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

platform class A<T> {}

platform class B<T> {
    platform func f(item: T): T {
      item
    }
}

platform class C<T> where T <: SuperI  {}
platform class D<T> {}

extend String <: I {}
extend Int <: I {}
 
main(): Unit {
    let _ = A<String>()
    let b = B<Int>()
    println(b.f(111))
    println(b.f2(222))
    let _ = C<String>()
    let _ = D<String>()
}
 
/* SCAN
111
222
*/
