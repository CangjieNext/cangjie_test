// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c


package cmp
public common struct B {
    public common var b: Int64=1;
    public init(_b: Int64) {
        b = _b;
    }
    public common func fb():Unit{println("hello from common fb")}
}
public struct C {
    public let c = 100;
    public init() {}
}
public common struct A {
    public common let f1: (B) -> B = { b: B => println("hello from f1 common. I pass struct B"); b}
    public common let f2: (C) -> C = { c: C => println("hello from f2 common. I pass struct C"); c}

    public  init() {
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp
public platform struct B {
    public platform var b: Int64=2;
    public platform func fb():Unit{println("hello from platform fb");}
    public func fb1() {println("hello from fb1");}
}
public platform struct A {
    public platform let f1: (B) -> B = { b: B => println("hello from f1 platform. I pass struct B"); b}
    public platform let f2: (C) -> C = { c: C => println("hello from f2 platform. I pass struct C"); c}
}


// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    let a1 = A()
    let b1 = B(10)
    let b2 = B(20)
    let c = C()
    println(a1.f1(b1).b);
    a1.f1(b1).fb();
    a1.f1(b2).fb1();
    println(a1.f2(c).c);
}

/* SCAN
hello from f1 platform. I pass struct B
10
hello from f1 platform. I pass struct B
hello from platform fb
hello from f1 platform. I pass struct B
hello from fb1
hello from f2 platform. I pass struct C
100
*/
