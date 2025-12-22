// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

interface GeneralInter{}

struct GeneralStruct <: GeneralInter{}

common struct A {
    common func testFunc(i: GeneralInter): Unit
    common func testFunc1(i: GeneralInter): Unit {
        println("common")
    }
    common func testFunc2(i: GeneralInter): Unit {
        println("common")
    }
    init() {}
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

platform struct A {
    platform func testFunc(i: GeneralInter): Unit {
        println("platform")
    }
    platform func testFunc1(i: GeneralInter): Unit {
        println("platform")
    }
}

main() : Unit {
    A().testFunc(GeneralStruct())
    A().testFunc1(GeneralStruct())
    A().testFunc2(GeneralStruct())
}

/* SCAN
platform
platform
common
*/