// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: lib/lib.cj
// EXEC-0: %compiler %noColor lib/lib.cj --output-type=dylib --output-dir ./lib
package testImport

public enum A{
    ONE|TWO|THREE
    public func printType() {
        println("Number")
    }
}
public enum B{
    A|B|C
    public func printType() {
        println("word")
    }
}
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c --import-path=./lib
package cmp
import testImport.*
    
common func foo(arg: A):B {
    println("common")
    return B.A
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --import-path ./lib -L./lib -ltestImport -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p:./lib && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;./lib;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p:./lib && %run %output 2>&1 | compare %f
package cmp
import testImport.*

specific func foo(arg: A): B {
    arg.printType()
    println("specific")
    return B.A
}

main() {
    let a=A.ONE
    let b=foo(a)
    b.printType()
    return 
}

/* SCAN
Number
specific
word
*/