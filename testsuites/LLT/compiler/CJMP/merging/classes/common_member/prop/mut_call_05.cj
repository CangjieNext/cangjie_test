// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common class A {
    mut prop p: Int64 {
        get() {
            println("get prop p")
            1
        }
        set(v) {
            println("set prop p")
        }
    }
    common mut prop testProp: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (LLVM and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (LLVM and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (LLVM and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

platform class A {
    init() {}
    platform mut prop testProp: Int64 {
        get() {
            p
        }
        set(v) {
            p = v
        }
    }
}

main() : Unit {
    var a = A()
    a.testProp
    a.testProp = 1
}

/* SCAN
get prop p
set prop p
*/