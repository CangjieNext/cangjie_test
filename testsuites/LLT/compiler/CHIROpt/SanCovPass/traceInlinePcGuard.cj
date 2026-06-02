// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: sancov.h sancov.cpp
// (CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -c -fPIC %stdc++_opt sancov.cpp -o sancov.o
// (CJNATIVE and DEBUG_OPTION) EXEC: %compiler --sanitizer-coverage-level=1 --sanitizer-coverage-trace-pc-guard sancov.o %n.cj -o %output
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// (CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt --sanitizer-coverage-level=2 --sanitizer-coverage-trace-pc-guard sancov.o %n.cj -o %output  2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// (not CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -shared -fPIC %stdc++_opt sancov.cpp -o libsancov.so
// (not CJNATIVE and DEBUG_OPTION) EXEC: %compiler --sanitizer-coverage-level=1 --sanitizer-coverage-trace-pc-guard -o %n.%suffix %n.cj -lsancov
// (not CJNATIVE and DEBUG_OPTION) RUN-EXEC: LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:. %run %n.%suffix %run_args
// (not CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt --sanitizer-coverage-level=2 --sanitizer-coverage-trace-pc-guard -o %n.%suffix %n.cj -lsancov 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) RUN-EXEC: LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:. %run %n.%suffix %run_args

// ASSERT: scan-16 [SanitizerCoverage] Add trace pc guard at [0,0].

foreign func ShowUInt32Array(): Unit

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

func D(n: Int32): Int64 {
    var t: Int64 = 0
    match (n) {
        case 1 => t = 1
        case 2 => t = 2
        case _ => t = 3
    }
    return t
}

func f2(): Int64 {
    var i: Int32 = 0
    var t: Int64 = f1(1, 1, 1, 1)
    while (i < 3) {
        t += 1
        i += 1
        break;
    }
    return t
}

main() {
    println(" ----- before -----")
    unsafe { ShowUInt32Array() };
    D(1)
    f1(1, 1, 1, 1)
    f2()
    println(" ----- after -----")
    unsafe { ShowUInt32Array() };
    0
}
