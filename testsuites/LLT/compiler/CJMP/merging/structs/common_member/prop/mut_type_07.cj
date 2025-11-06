// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

type funcType =  ()-> Unit

common struct A {
    common mut prop testProp: funcType
    common mut prop testProp1: funcType {
        get() {
            println("common")
            {=> println("testLambda")}
        }
        set(v) {
            println("common")
            v()
        }
    }
    common mut prop testProp2: funcType {
        get() {
            println("common")
            {=> println("testLambda")}
        }
        set(v) {
            println("common")
            v()
        }
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
    platform mut prop testProp: funcType {
        get() {
            println("platform")
            {=> println("testLambda")}
        }
        set(v) {
            println("common")
            v()
        }
    }
    platform mut prop testProp1: funcType {
        get() {
            println("platform")
            {=> println("testLambda")}
        }
        set(v) {
            println("common")
            v()
        }
    }
}

main() : Unit {
    var a = A()
    (a.testProp)()
    a.testProp = {=> println("main")}
    (a.testProp1)()
    a.testProp1 = {=> println("main")}
    (a.testProp2)()
    a.testProp2 = {=> println("main")}
}

/* SCAN
platform
testLambda
common
main
platform
testLambda
common
main
common
testLambda
common
main
*/