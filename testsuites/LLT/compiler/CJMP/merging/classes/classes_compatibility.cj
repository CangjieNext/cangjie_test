// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common public class A {
    common public init() {}
    common public func foo(): Unit 
    common public func boo(): Unit {
        println("[common] a.boo()")
    }
    common public func goo(): Unit {
        println("[common] a.goo()")
    }
    public func koo(): Unit {
        println("[common] a.koo()")
    }

    public func selfRefCommon(): Unit {
        println("selfRefCommon")
        foo()
        boo()
        goo()
        koo()
    }
}

public func receiveCommonA(a: A) {
    println("receiveCommonA:")
    a.foo()
    a.boo()
    a.goo()
    a.koo()
}

public func passCommonA() {
    println("passCommonA:")
    let a = A()
    receiveCommonA(a)
    a.selfRefCommon()
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

specific public class A {
    specific public func foo(): Unit {
        println("[specific] a.foo()")
    }
    specific public func boo(): Unit {
        println("[specific] a.boo()")
    }
    public func loo(): Unit {
        println("[specific] a.loo()")
    }

    public func selfRefPlatform(): Unit {
        println("selfRefPlatform")
        foo()
        boo()
        goo()
        koo()
        loo()
    }
}

public func receivePlatformA(a: A) {
    println("receivePlatformA:")
    a.foo()
    a.boo()
    a.goo()
    a.koo()
    a.loo()
}

public func passPlatformA() {
    println("passPlatformA:")
    let a = A()
    receiveCommonA(a)
    receivePlatformA(a)
    a.selfRefCommon()
    a.selfRefPlatform()
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

public func passMainA() {
    println("passMainA:")
    let a = A()
    receiveCommonA(a)
    receivePlatformA(a)
    a.selfRefCommon()
    a.selfRefPlatform()
}

main(): Unit {
    passCommonA()
    passPlatformA()
    passMainA()
}

/* SCAN
passCommonA:
receiveCommonA:
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
selfRefCommon
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
passPlatformA:
receiveCommonA:
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
receivePlatformA:
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
[specific] a.loo()
selfRefCommon
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
selfRefPlatform
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
[specific] a.loo()
passMainA:
receiveCommonA:
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
receivePlatformA:
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
[specific] a.loo()
selfRefCommon
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
selfRefPlatform
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
[specific] a.loo()
*/

// SEPARATE-FILE: m_common_only.cj
// EXEC-0: %compiler %noColor -j8 m_common_only.cj --import-path=./c -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

public func passMainA() {
    println("passMainA:")
    let a = A()
    receiveCommonA(a)
    a.selfRefCommon()
}

main(): Unit {
    passCommonA()
    passMainA()
}

/* SCAN
passCommonA:
receiveCommonA:
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
selfRefCommon
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
passMainA:
receiveCommonA:
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
selfRefCommon
[specific] a.foo()
[specific] a.boo()
[common] a.goo()
[common] a.koo()
*/
