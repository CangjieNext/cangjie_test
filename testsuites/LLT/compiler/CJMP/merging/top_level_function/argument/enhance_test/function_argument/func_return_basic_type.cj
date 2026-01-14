// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
common func foo(arg: ()->Int32): Unit {
    arg()
    println("common")
}
common func foo(arg: ()->IntNative): Unit {
    arg()
    println("common")
}
common func foo(arg: ()->UInt32): Unit {
    arg()
    println("common")
}
common func foo(arg: ()->UIntNative): Unit {
    arg()
    println("common")
}
common func foo(arg: ()->Float32): Unit {
    arg()
    println("common")
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
func goo1():Int32{
    println("goo1")
    1
}
func goo2():IntNative{
    println("goo2")
    1
}
func goo3():UInt32{
    println("goo3")
    1
}
func goo4():UIntNative{
    println("goo4")
    1
}
func goo5():Float32{
    println("goo5")
    1.1
}
specific func foo(arg: ()->Int32): Unit {
    arg()
    println("specific")
}
specific func foo(arg: ()->IntNative): Unit {
    arg()
    println("specific")
}
specific func foo(arg: ()->UInt32): Unit {
    arg()
    println("specific")
}
specific func foo(arg: ()->UIntNative): Unit {
    arg()
    println("specific")
}
specific func foo(arg: ()->Float32): Unit {
    arg()
    println("specific")
}
main() {
    foo(goo1)
    foo(goo2)
    foo(goo3)
    foo(goo4)
    foo(goo5)
}

/* SCAN
goo1
specific
goo2
specific
goo3
specific
goo4
specific
goo5
specific
*/