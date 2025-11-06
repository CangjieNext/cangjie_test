// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

import std.random.*

public enum WithoutArgs {
    | AA
    | BB

    public func memberFunc() {
        match (this) {
            case AA => println("From member func: AA")
            case BB => println("From member func: BB")
        }
    }
}

public enum WithArgs {
    | CC(String)
    | DD(String)

    public func memberFunc() {
        match (this) {
            case CC(s) => println("From member func: CC(${s})")
            case DD(s) => println("From member func: DD(${s})")
        }
    }
}

public common func foo(x: Int64, random: Random, array: Array<Int64>, a: WithoutArgs): Unit
public common func foo(x: Int64, random: Random, array: Array<Int64>, a: WithArgs): Unit

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

import std.random.*

public platform func foo(x: Int64, random: Random, array: Array<Int64>, a: WithoutArgs): Unit {
    a.memberFunc()
    println("${x}_${random.nextInt64() % 1}_${array[0]}")
}

public platform func foo(x: Int64, random: Random, array: Array<Int64>, a: WithArgs): Unit {
    a.memberFunc()
    println("${x}_${random.nextInt64() % 1}_${array[0]}")
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

import std.random.*

main(): Unit {
    // AA
    println("AA")
    foo(
        42,
        Random(), 
        Array(1, repeat: 44),
        AA
    )
    AA.memberFunc()
    let x = AA
    x.memberFunc()
    // BB
    println("BB")
    foo(
        42,
        Random(), 
        Array(1, repeat: 44),
        BB
    )
    BB.memberFunc()
    let y = BB
    y.memberFunc()
    // CC("s")
    println("CC(s)")
    foo(
        42,
        Random(), 
        Array(1, repeat: 44),
        CC("s")
    )
    CC("s").memberFunc()
    let z1 = CC("s")
    z1.memberFunc()
    // DD(s)
    println("DD(s)")
    foo(
        42,
        Random(), 
        Array(1, repeat: 44),
        DD("s")
    )
    DD("s").memberFunc()
    let z2 = DD("s")
    z2.memberFunc()
}      
       
/* SCAN-IN
AA
From member func: AA
42_0_44
From member func: AA
From member func: AA
BB
From member func: BB
42_0_44
From member func: BB
From member func: BB
CC(s)
From member func: CC(s)
42_0_44
From member func: CC(s)
From member func: CC(s)
DD(s)
From member func: DD(s)
42_0_44
From member func: DD(s)
From member func: DD(s)
*/
