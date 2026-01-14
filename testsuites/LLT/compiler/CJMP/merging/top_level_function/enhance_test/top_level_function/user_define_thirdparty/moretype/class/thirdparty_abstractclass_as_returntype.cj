// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: lib/lib.cj
// EXEC-0: %compiler %noColor lib/lib.cj --output-type=dylib --output-dir ./lib
package testImport

public abstract class A {
    public func goo():Unit
}
public class B<:A{
    public func goo():Unit{
        println("Class B")
    }
}
public class C<:A{
    public func goo():Unit{
        println("Class C")
    }
}
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c --import-path=./lib
package cmp
import testImport.*
    
common func foo(arg: A): A {
    println("common")
    return C()
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --import-path ./lib -L./lib -ltestImport -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p:./lib && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;./lib;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p:./lib && %run %output 2>&1 | compare %f
package cmp
import testImport.*

specific func foo(arg: A): A {
    arg.goo()
    println("specific")
    return C()
}

main() {
    let c=foo(B())
    c.goo()
}

/* SCAN
Class B
specific
Class C
*/