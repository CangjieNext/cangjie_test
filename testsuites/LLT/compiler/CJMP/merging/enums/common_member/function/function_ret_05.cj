// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

enum GeneralEnum {
    GeneralEnumElemt
}

common enum A {
    | TEST_ENUM

    common func testFunc(): GeneralEnum
    common func testFunc1(): GeneralEnum {
        println("common")
        GeneralEnumElemt
    }
    common func testFunc2(): GeneralEnum {
        println("common")
        GeneralEnumElemt
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

specific enum A {
    | TEST_ENUM

    specific func testFunc(): GeneralEnum {
        println("specific")
        GeneralEnumElemt
    }
    specific func testFunc1(): GeneralEnum {
        println("specific")
        GeneralEnumElemt
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