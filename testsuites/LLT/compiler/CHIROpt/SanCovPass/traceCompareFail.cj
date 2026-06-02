// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: sancov.h sancov.cpp
// (CJNATIVE) EXEC: %clang++ -c -fPIC %stdc++_opt sancov.cpp -o sancov.o
// (CJNATIVE) EXEC-0: %compiler --fchir-switch-opt --chir-opt-debug --sanitizer-coverage-trace-compares sancov.o %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-0: %run %run_opt %output %run_args
// (not CJNATIVE) EXEC: %clang++ -shared -fPIC %stdc++_opt sancov.cpp -o libsancov.so
// (not CJNATIVE) EXEC: %compiler %cmp_opt %debugCHIROpt --sanitizer-coverage-trace-compares -o %n.%suffix %n.cj -lsancov 2>&1 | compare %f
// ASSERT: scan-not [SanitizerCoverage] Add trace compares at [20,9].
// ASSERT: scan-not [SanitizerCoverage] Add trace compares at [21,13].
// (not CJNATIVE) RUN-EXEC: LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:. %run %n.%suffix %run_args

foreign func ShowSwitchArray(): Unit

func f1(t1: Float16, t2: Float32): Int64 {
    if (t1 != 0.0) {
        if (t2 != 0.0) {
            return 0
        }
    }
    return 1
}

main() {
    f1(1.0, 1.0)
    0
}
