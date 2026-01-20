// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public var a = "initial"

public func foo() {
    a += " common"
}

private func getX() {
    "defaultX"
}

public var x = getX()

public func printFromCommon() {
    println(a)
    println("x:" + x)
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public let b = "b"

public func boo() {
    a += " specific"
}

func getY() {
    "defaultY"
}

var y = getY()

public func printFromPlatform() {
    println(a)
    println("y:" + y)
}

public func printBFromPlatform() {
    println(b)
}

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    printFromCommon()
    printFromPlatform()
    println(a)
    foo()
    println(a)
    boo()
    println(a)
    printFromCommon()
    printFromPlatform()

    printBFromPlatform()
    println(b)
}

/* SCAN
initial
x:defaultX
initial
y:defaultY
initial
initial common
initial common specific
initial common specific
x:defaultX
initial common specific
y:defaultY
b
b
*/