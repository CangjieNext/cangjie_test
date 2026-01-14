// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common class A {
    common func f(): Int64 {
        println("error")
        return testProp
    }

    common func f1(a: Int64): Unit {
        println("error")
    }
    common mut prop testProp: Int64 {
        get() {
            println("error")
            0
        }
        set(v) {
            println("error")
        }
    }
    init() {}
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

specific class A {
    specific func f(): Int64 {
        return testProp
    }

    specific func f1(a: Int64): Unit {
        testProp = a
    }

    specific mut prop testProp: Int64 {
        get() {
            println("get prop")
            1
        }
        set(v) {
            println("set prop ${v}")
        }
    }
}

main() : Unit {
    var a = A()
    a.f()
    a.f1(1)
}

/* SCAN
get prop
set prop 1
*/