// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// DEPENDENCE: sancov.h sancov.cpp
// (CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -c -fPIC %stdc++_opt sancov.cpp -o sancov.o
// (CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt --sanitizer-coverage-trace-memcmp sancov.o %n.cj -o %output
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -shared -fPIC %stdc++_opt sancov.cpp -o libsancov.so
// (not CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt --sanitizer-coverage-trace-memcmp -o %n.%suffix %n.cj -lsancov
// (not CJNATIVE and DEBUG_OPTION) RUN-EXEC-PIPE: LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:. %run %n.%suffix %run_args 2>&1 | compare %f

// ASSERT: scan-begin __cj_sanitizer_weak_hook_memcmp func
// ASSERT: scan-next string1: test
// ASSERT: scan-next string2: 12
// ASSERT: scan-next size: 4

main(): Int64 {
    let str = "test"
    var res5: Int64 = str.indexOf("12") ?? -1
    var res1: Int64 = str.indexOf(12) ?? -1
    0
}
