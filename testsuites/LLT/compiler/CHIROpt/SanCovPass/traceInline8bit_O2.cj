// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: sancov.h sancov.cpp
// (CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -c -fPIC %stdc++_opt sancov.cpp -o sancov.o
// (CJNATIVE and DEBUG_OPTION) EXEC: %compiler %enableO2 --sanitizer-coverage-level=1 --sanitizer-coverage-inline-8bit-counters sancov.o %n.cj -o %output 
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// (CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt %enableO2 --sanitizer-coverage-inline-8bit-counters sancov.o %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// (not CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -shared -fPIC %stdc++_opt sancov.cpp -o libsancov.so
// (not CJNATIVE and DEBUG_OPTION) EXEC: %compiler --sanitizer-coverage-level=1 --sanitizer-coverage-inline-8bit-counters -o %n.%suffix %n.cj -lsancov
// (not CJNATIVE and DEBUG_OPTION) RUN-EXEC: LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:. %run %n.%suffix %run_args
// (not CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt --sanitizer-coverage-inline-8bit-counters -o %n.%suffix %n.cj -lsancov 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) RUN-EXEC: LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:. %run %n.%suffix %run_args

// ASSERT: scan-15 [SanitizerCoverage] Add trace inline 8 bit at [0,0].

// switch => match
func D(n: Int32): Int64 {
    var t: Int64 = 0
    match (n) {
        case 1 => t = 1
        case 2 => t = 2
        case _ => t = 3
    }
    return t
}

func f2(): Int32 {
    var i: Int32 = 0
    while (i < 5) {
        i += 1
    }
    return i
}

main() {
    D(1)
    try {
        f2()
    } catch (_) {
        println("catch an exception!")
    }
    0
}
