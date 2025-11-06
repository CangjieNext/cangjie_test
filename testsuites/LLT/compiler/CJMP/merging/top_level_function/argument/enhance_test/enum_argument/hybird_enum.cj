// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
func ONE(a:Int32):Int32{
    a
}
func TWO(a:Int32):Int32{
    a
}
func THREE(a:Int32):Int32{
    a
}
enum A {
    ONE|TWO|THREE|ONE(Int32)|TWO(Int32)|THREE(Int32)
}
    
common func foo(arg: A): Unit {
    println("common")
}

common func foo1(arg: A): Unit

common func foo2(arg: A): Unit {
    println("common")
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

platform func foo(arg: A): Unit {
    println("platform")
}

platform func foo1(arg: A): Unit {
    println("platform")
}

main() {
    foo(A.ONE)
    foo1(A.TWO)
    foo2(A.THREE)
    foo(A.ONE(1))
    foo1(A.TWO(2))
    foo2(A.THREE(3))
}

/* SCAN
platform
platform
common
platform
platform
common
*/