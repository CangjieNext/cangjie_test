// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: sancov.h sancov.cpp
// (CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -c -fPIC %stdc++_opt sancov.cpp -o sancov.o
// (CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt --sanitizer-coverage-trace-compares sancov.o %n.cj -o %output 
// (CJNATIVE and DEBUG_OPTION) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -shared -fPIC %stdc++_opt sancov.cpp -o libsancov.so
// (not CJNATIVE and DEBUG_OPTION) EXEC: %compiler %cmp_opt %debugCHIROpt --sanitizer-coverage-trace-compares -o %n.%suffix %n.cj -lsancov
// (not CJNATIVE and DEBUG_OPTION) RUN-EXEC-PIPE: LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:. %run %n.%suffix %run_args 2>&1 | compare %f

// ASSERT: scan fooCounter = 1
// ASSERT: scan gooCounter = 2

var fooCounter = 0
var gooCounter = 0

func foo(): Bool {
    if (goo() == hoo()) {
        ()
    }

    let _ = goo() == 0

    return false
}

func hoo() {
    fooCounter++
    fooCounter
}

func goo() {
    gooCounter++
    gooCounter
}

main() {
    foo()
    println("fooCounter = ${fooCounter}")
    println("gooCounter = ${gooCounter}")
    return 0
}
