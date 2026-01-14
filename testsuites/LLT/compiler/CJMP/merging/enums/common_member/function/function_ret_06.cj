// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

import std.collection.*

class GeneralClass {}

common enum A {
    | TEST_ENUM

    common func testFunc(): ArrayList<GeneralClass>
    common func testFunc1(): ArrayList<GeneralClass> {
        println("common")
        ArrayList<GeneralClass>()
    }
    common func testFunc2(): ArrayList<GeneralClass> {
        println("common")
        ArrayList<GeneralClass>()
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

import std.collection.*

specific enum A {
    | TEST_ENUM

    specific func testFunc(): ArrayList<GeneralClass> {
        println("specific")
        ArrayList<GeneralClass>()
    }
    specific func testFunc1(): ArrayList<GeneralClass> {
        println("specific")
        ArrayList<GeneralClass>()
    }
}

main() : Unit {
    TEST_ENUM.testFunc()
    TEST_ENUM.testFunc1()
    TEST_ENUM.testFunc2()
}

/* SCAN
specific
specific
common
*/