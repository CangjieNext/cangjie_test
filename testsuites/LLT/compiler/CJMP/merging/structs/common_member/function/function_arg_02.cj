// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common struct A {
    common func testFunc(a1: Int64, a2: Int64, a3: Int64, a4: Int64, a5: Int64, a6: Int64, a7: Int64, a8: Int64, a9: Int64, a10: Int64, a11: Int64, a12: Int64, a13: Int64, a14: Int64, a15: Int64, a16: Int64, a17: Int64, a18: Int64): Unit
    common func testFunc1(a1: Int64, a2: Int64, a3: Int64, a4: Int64, a5: Int64, a6: Int64, a7: Int64, a8: Int64, a9: Int64, a10: Int64, a11: Int64, a12: Int64, a13: Int64, a14: Int64, a15: Int64, a16: Int64, a17: Int64, a18: Int64): Unit {
        println("common")
    }
    common func testFunc2(a1: Int64, a2: Int64, a3: Int64, a4: Int64, a5: Int64, a6: Int64, a7: Int64, a8: Int64, a9: Int64, a10: Int64, a11: Int64, a12: Int64, a13: Int64, a14: Int64, a15: Int64, a16: Int64, a17: Int64, a18: Int64): Unit {
        println("common")
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

platform struct A {
    init() {}
    platform func testFunc(a1: Int64, a2: Int64, a3: Int64, a4: Int64, a5: Int64, a6: Int64, a7: Int64, a8: Int64, a9: Int64, a10: Int64, a11: Int64, a12: Int64, a13: Int64, a14: Int64, a15: Int64, a16: Int64, a17: Int64, a18: Int64): Unit {
        println("platform")
    }
    platform func testFunc1(a1: Int64, a2: Int64, a3: Int64, a4: Int64, a5: Int64, a6: Int64, a7: Int64, a8: Int64, a9: Int64, a10: Int64, a11: Int64, a12: Int64, a13: Int64, a14: Int64, a15: Int64, a16: Int64, a17: Int64, a18: Int64): Unit {
        println("platform")
    }
}

main() : Unit {
    A().testFunc(1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8)
    A().testFunc1(1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8)
    A().testFunc2(1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8)
}

/* SCAN
platform
platform
common
*/