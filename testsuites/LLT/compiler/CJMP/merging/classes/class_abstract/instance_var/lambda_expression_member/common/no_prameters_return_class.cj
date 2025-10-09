// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c


package cmp
public common class B {
    public common let b: Int64=1;
    public init() {

    }
    public common func fb():Unit{println("hello from common fb")}
}
public class C {
    public let c = 100;
    public init() {}
}
public common class A {
    public common let f1: () -> B = { => println("hello from f1 common. I create class B"); B();}
    public common let f2: () -> C = { => println("hello from f2 common. I create class C"); C();}
    public  init() {
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp
public platform class B {
    public platform let b: Int64=2;
    public platform func fb():Unit{println("hello from platform fb");}
    public func fb1() {println("hello from fb1");}
}
public platform class A {
    public platform let f1:() -> B = { => println("hello from f1 platform. I create class B"); B();}
    public platform let f2:() -> C = { => println("hello from f2 platform. I create class C"); C();}
}


// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output
// (LLVM and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (LLVM and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (LLVM and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    let a1 = A()
    println(a1.f1().b);
    a1.f1().fb();
    a1.f1().fb1();
    println(a1.f2().c);
}

/* SCAN
hello from f1 platform. I create class B
2
hello from f1 platform. I create class B
hello from platform fb
hello from f1 platform. I create class B
hello from fb1
hello from f2 platform. I create class C
100
*/
