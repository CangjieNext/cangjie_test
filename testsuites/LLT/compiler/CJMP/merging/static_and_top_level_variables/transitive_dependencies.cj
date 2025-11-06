// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public var a = 1

private func f01() {
    a
}

private func f02() {
    10 + f01()
}

public var b = f02()


// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public var c = a * 2

private func f11() {
    c
}

private func f12() {
    a + b + f11()
}

public var d = f12()

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(a)
    println(b)
    println(c)
    println(d)
}

// NOTE: The test check that transitive dependencies via private functions works

/* SCAN
1
11
2
14
*/