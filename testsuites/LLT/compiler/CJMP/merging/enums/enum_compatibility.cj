// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common public enum A {
    | AA
    | BB
    | CC(String)
    | CC(String, String)

    common public func foo(): Unit 
    common public func boo(): Unit {
        match (this) {
            case AA => println("[ common ] a.boo(): AA")
            case BB => println("[ common ] a.boo(): BB")
            case CC(s) => println("[ common ] a.boo(): CC(${s})")
            case CC(s1, s2) => println("[ common ] a.boo(): CC(${s1}, ${s2})")
        }
    }
    common public func goo(): Unit {
        match (this) {
            case AA => println("[ common ] a.goo(): AA")
            case BB => println("[ common ] a.goo(): BB")
            case CC(s) => println("[ common ] a.goo(): CC(${s})")
            case CC(s1, s2) => println("[ common ] a.goo(): CC(${s1}, ${s2})")
        }
    }
    public func koo(): Unit {
        match (this) {
            case AA => println("[ common ] a.koo(): AA")
            case BB => println("[ common ] a.koo(): BB")
            case CC(s) => println("[ common ] a.koo(): CC(${s})")
            case CC(s1, s2) => println("[ common ] a.koo(): CC(${s1}, ${s2})")
        }
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
    let a = AA
    receiveCommonA(a)
    a.selfRefCommon()
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

platform public enum A {
    | AA
    | BB
    | CC(String)
    | CC(String, String)

    platform public func foo(): Unit {
        match (this) {
            case AA => println("[platform] a.foo(): AA")
            case BB => println("[platform] a.foo(): BB")
            case CC(s) => println("[platform] a.foo(): CC(${s})")
            case CC(s1, s2) => println("[platform] a.foo(): CC(${s1}, ${s2})")
        }
    }

    platform public func boo(): Unit {
        match (this) {
            case AA => println("[platform] a.boo(): AA")
            case BB => println("[platform] a.boo(): BB")
            case CC(s) => println("[platform] a.boo(): CC(${s})")
            case CC(s1, s2) => println("[platform] a.boo(): CC(${s1}, ${s2})")
        }
    }
    public func loo(): Unit {
        match (this) {
            case AA => println("[platform] a.loo(): AA")
            case BB => println("[platform] a.loo(): BB")
            case CC(s) => println("[platform] a.loo(): CC(${s})")
            case CC(s1, s2) => println("[platform] a.loo(): CC(${s1}, ${s2})")
        }
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
    let a = AA
    let b = BB 
    let c1 = CC("s")
    let c2 = CC("s1", "s2")

    receiveCommonA(a)
    receivePlatformA(a)
    receiveCommonA(b)
    receivePlatformA(b)
    receiveCommonA(c1)
    receivePlatformA(c1)
    receiveCommonA(c2)
    receivePlatformA(c2)
    a.selfRefCommon()
    a.selfRefPlatform()
    b.selfRefCommon()
    b.selfRefPlatform()
    c1.selfRefCommon()
    c1.selfRefPlatform()
    c2.selfRefCommon()
    c2.selfRefPlatform()
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

public func passMainA() {
    println("passMainA:")
    let a = AA
    let b = BB 
    let c1 = CC("s")
    let c2 = CC("s1", "s2")
    receiveCommonA(a)
    receivePlatformA(a)
    receiveCommonA(b)
    receivePlatformA(b)
    receiveCommonA(c1)
    receivePlatformA(c1)
    receiveCommonA(c2)
    receivePlatformA(c2)
    a.selfRefCommon()
    a.selfRefPlatform()
    b.selfRefCommon()
    b.selfRefPlatform()
    c1.selfRefCommon()
    c1.selfRefPlatform()
    c2.selfRefCommon()
    c2.selfRefPlatform()
}

main(): Unit {
    passCommonA()
    passPlatformA()
    passMainA()
}

/* SCAN
passCommonA:
receiveCommonA:
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
selfRefCommon
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
passPlatformA:
receiveCommonA:
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
receivePlatformA:
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
[platform] a.loo(): AA
receiveCommonA:
[platform] a.foo(): BB
[platform] a.boo(): BB
[ common ] a.goo(): BB
[ common ] a.koo(): BB
receivePlatformA:
[platform] a.foo(): BB
[platform] a.boo(): BB
[ common ] a.goo(): BB
[ common ] a.koo(): BB
[platform] a.loo(): BB
receiveCommonA:
[platform] a.foo(): CC(s)
[platform] a.boo(): CC(s)
[ common ] a.goo(): CC(s)
[ common ] a.koo(): CC(s)
receivePlatformA:
[platform] a.foo(): CC(s)
[platform] a.boo(): CC(s)
[ common ] a.goo(): CC(s)
[ common ] a.koo(): CC(s)
[platform] a.loo(): CC(s)
receiveCommonA:
[platform] a.foo(): CC(s1, s2)
[platform] a.boo(): CC(s1, s2)
[ common ] a.goo(): CC(s1, s2)
[ common ] a.koo(): CC(s1, s2)
receivePlatformA:
[platform] a.foo(): CC(s1, s2)
[platform] a.boo(): CC(s1, s2)
[ common ] a.goo(): CC(s1, s2)
[ common ] a.koo(): CC(s1, s2)
[platform] a.loo(): CC(s1, s2)
selfRefCommon
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
selfRefPlatform
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
[platform] a.loo(): AA
selfRefCommon
[platform] a.foo(): BB
[platform] a.boo(): BB
[ common ] a.goo(): BB
[ common ] a.koo(): BB
selfRefPlatform
[platform] a.foo(): BB
[platform] a.boo(): BB
[ common ] a.goo(): BB
[ common ] a.koo(): BB
[platform] a.loo(): BB
selfRefCommon
[platform] a.foo(): CC(s)
[platform] a.boo(): CC(s)
[ common ] a.goo(): CC(s)
[ common ] a.koo(): CC(s)
selfRefPlatform
[platform] a.foo(): CC(s)
[platform] a.boo(): CC(s)
[ common ] a.goo(): CC(s)
[ common ] a.koo(): CC(s)
[platform] a.loo(): CC(s)
selfRefCommon
[platform] a.foo(): CC(s1, s2)
[platform] a.boo(): CC(s1, s2)
[ common ] a.goo(): CC(s1, s2)
[ common ] a.koo(): CC(s1, s2)
selfRefPlatform
[platform] a.foo(): CC(s1, s2)
[platform] a.boo(): CC(s1, s2)
[ common ] a.goo(): CC(s1, s2)
[ common ] a.koo(): CC(s1, s2)
[platform] a.loo(): CC(s1, s2)
passMainA:
receiveCommonA:
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
receivePlatformA:
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
[platform] a.loo(): AA
receiveCommonA:
[platform] a.foo(): BB
[platform] a.boo(): BB
[ common ] a.goo(): BB
[ common ] a.koo(): BB
receivePlatformA:
[platform] a.foo(): BB
[platform] a.boo(): BB
[ common ] a.goo(): BB
[ common ] a.koo(): BB
[platform] a.loo(): BB
receiveCommonA:
[platform] a.foo(): CC(s)
[platform] a.boo(): CC(s)
[ common ] a.goo(): CC(s)
[ common ] a.koo(): CC(s)
receivePlatformA:
[platform] a.foo(): CC(s)
[platform] a.boo(): CC(s)
[ common ] a.goo(): CC(s)
[ common ] a.koo(): CC(s)
[platform] a.loo(): CC(s)
receiveCommonA:
[platform] a.foo(): CC(s1, s2)
[platform] a.boo(): CC(s1, s2)
[ common ] a.goo(): CC(s1, s2)
[ common ] a.koo(): CC(s1, s2)
receivePlatformA:
[platform] a.foo(): CC(s1, s2)
[platform] a.boo(): CC(s1, s2)
[ common ] a.goo(): CC(s1, s2)
[ common ] a.koo(): CC(s1, s2)
[platform] a.loo(): CC(s1, s2)
selfRefCommon
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
selfRefPlatform
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
[platform] a.loo(): AA
selfRefCommon
[platform] a.foo(): BB
[platform] a.boo(): BB
[ common ] a.goo(): BB
[ common ] a.koo(): BB
selfRefPlatform
[platform] a.foo(): BB
[platform] a.boo(): BB
[ common ] a.goo(): BB
[ common ] a.koo(): BB
[platform] a.loo(): BB
selfRefCommon
[platform] a.foo(): CC(s)
[platform] a.boo(): CC(s)
[ common ] a.goo(): CC(s)
[ common ] a.koo(): CC(s)
selfRefPlatform
[platform] a.foo(): CC(s)
[platform] a.boo(): CC(s)
[ common ] a.goo(): CC(s)
[ common ] a.koo(): CC(s)
[platform] a.loo(): CC(s)
selfRefCommon
[platform] a.foo(): CC(s1, s2)
[platform] a.boo(): CC(s1, s2)
[ common ] a.goo(): CC(s1, s2)
[ common ] a.koo(): CC(s1, s2)
selfRefPlatform
[platform] a.foo(): CC(s1, s2)
[platform] a.boo(): CC(s1, s2)
[ common ] a.goo(): CC(s1, s2)
[ common ] a.koo(): CC(s1, s2)
[platform] a.loo(): CC(s1, s2)
*/

// SEPARATE-FILE: m_common_only.cj
// EXEC-0: %compiler %noColor -j8 m_common_only.cj --import-path=./c -L./p -lcmp -o only%output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run only%output 2>&1 | compare %f
import cmp.*

public func passMainA() {
    println("passMainA:")
    let a = AA
    let b = BB 
    let c1 = CC("s")
    let c2 = CC("s1", "s2")
    receiveCommonA(a)
    a.selfRefCommon()
    receiveCommonA(b)
    b.selfRefCommon()
    receiveCommonA(c1)
    c1.selfRefCommon()
    receiveCommonA(c2)
    c2.selfRefCommon()
}

main(): Unit {
    passCommonA()
    passMainA()
}

/* SCAN
passCommonA:
receiveCommonA:
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
selfRefCommon
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
passMainA:
receiveCommonA:
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
selfRefCommon
[platform] a.foo(): AA
[platform] a.boo(): AA
[ common ] a.goo(): AA
[ common ] a.koo(): AA
receiveCommonA:
[platform] a.foo(): BB
[platform] a.boo(): BB
[ common ] a.goo(): BB
[ common ] a.koo(): BB
selfRefCommon
[platform] a.foo(): BB
[platform] a.boo(): BB
[ common ] a.goo(): BB
[ common ] a.koo(): BB
receiveCommonA:
[platform] a.foo(): CC(s)
[platform] a.boo(): CC(s)
[ common ] a.goo(): CC(s)
[ common ] a.koo(): CC(s)
selfRefCommon
[platform] a.foo(): CC(s)
[platform] a.boo(): CC(s)
[ common ] a.goo(): CC(s)
[ common ] a.koo(): CC(s)
receiveCommonA:
[platform] a.foo(): CC(s1, s2)
[platform] a.boo(): CC(s1, s2)
[ common ] a.goo(): CC(s1, s2)
[ common ] a.koo(): CC(s1, s2)
selfRefCommon
[platform] a.foo(): CC(s1, s2)
[platform] a.boo(): CC(s1, s2)
[ common ] a.goo(): CC(s1, s2)
[ common ] a.koo(): CC(s1, s2)
*/
