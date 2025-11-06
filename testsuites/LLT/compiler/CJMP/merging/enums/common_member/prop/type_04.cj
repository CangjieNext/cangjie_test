// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

struct GeneralStruct {}

common enum A {
    | TEST_ENUM

    common prop testProp: GeneralStruct
    common prop testProp1: GeneralStruct {
        get() {
            println("common")
            GeneralStruct()
        }
    }
    common prop testProp2: GeneralStruct {
        get() {
            println("common")
            GeneralStruct()
        }
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

platform enum A {
    | TEST_ENUM

    platform prop testProp: GeneralStruct {
        get() {
            println("platform")
            GeneralStruct()
        }
    }
    platform prop testProp1: GeneralStruct {
        get() {
            println("platform")
            GeneralStruct()
        }
    }
}

main() : Unit {
    TEST_ENUM.testProp
    TEST_ENUM.testProp1
    TEST_ENUM.testProp2
}

/* SCAN
platform
platform
common
*/