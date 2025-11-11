// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

interface GeneralInter {}

class GeneralClass <: GeneralInter {}

common struct A {
    common mut prop testProp: GeneralInter
    common mut prop testProp1: GeneralInter {
        get() {
            println("common")
            GeneralClass()
        }
        set(v) {
            println("common")
        }
    }
    common mut prop testProp2: GeneralInter {
        get() {
            println("common")
            GeneralClass()
        }
        set(v) {
            println("common")
        }
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (LLVM and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (LLVM and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (LLVM and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

platform struct A {
    init() {}
    platform mut prop testProp: GeneralInter {
        get() {
            println("platform")
            GeneralClass()
        }
        set(v) {
            println("platform")
        }
    }
    platform mut prop testProp1: GeneralInter {
        get() {
            println("platform")
            GeneralClass()
        }
        set(v) {
            println("platform")
        }
    }
}

main() : Unit {
    var a = A()
    a.testProp
    a.testProp = GeneralClass()
    a.testProp1
    a.testProp1 = GeneralClass()
    a.testProp2
    a.testProp2 = GeneralClass()
}

/* SCAN
platform
platform
platform
platform
common
common
*/