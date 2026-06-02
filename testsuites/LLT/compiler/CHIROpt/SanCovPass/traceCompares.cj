// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: sancov.h sancov.cpp
// (CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -c -fPIC %stdc++_opt sancov.cpp -o sancov.o
// (CJNATIVE and DEBUG_OPTION) EXEC: %compiler --fchir-switch-opt --chir-opt-debug --sanitizer-coverage-trace-compares sancov.o %n.cj -o %output 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -shared -fPIC %stdc++_opt sancov.cpp -o libsancov.so
// (not CJNATIVE and DEBUG_OPTION) EXEC: %compiler %cmp_opt %debugCHIROpt --sanitizer-coverage-trace-compares -o %n.%suffix %n.cj -lsancov 2>&1 | compare %f
// ASSERT: scan [SanitizerCoverage] Add trace switch at [36,5].
// ASSERT: scan [SanitizerCoverage] Add trace compares at [22,9].
// ASSERT: scan [SanitizerCoverage] Add trace compares at [23,13].
// ASSERT: scan [SanitizerCoverage] Add trace compares at [24,17].
// ASSERT: scan [SanitizerCoverage] Add trace compares at [25,21].
// (not CJNATIVE and DEBUG_OPTION) RUN-EXEC: LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:. %run %n.%suffix %run_args

foreign func ShowSwitchArray(): Unit

func f1(t1: Int8, t2: Int16, t4: Int32, t8: Int64): Int64 {
    if (t1 != 0) {
        if (t2 != 0) {
            if (t4 != 0) {
                if (t8 != 0) {
                    return Int64(t1) & Int64(t2) & Int64(t4) & t8
                }
            }
        }
    }
    return 1
}

func fD(n: Int64): Int64 {
    var t: Int64 = 0
    match (n) {
        case 1 => t = 1
        case 2 => t = 2
        case 3 => t = 3
        case 4 => t = 4
        case 5 => t = 5
        case _ => t = 6
    }
    println(t)
    return t
}

main() {
    var a: Int64 = 1
    var b = fD(a)
    f1(1, 1, 1, 1)
    0
}
