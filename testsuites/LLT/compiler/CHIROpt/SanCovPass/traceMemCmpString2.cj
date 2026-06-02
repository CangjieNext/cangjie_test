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
// (not CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt --sanitizer-coverage-trace-memcmp -o %n.%suffix %n.cj -lsancov 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) RUN-EXEC-PIPE: LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:. %run %n.%suffix %run_args 2>&1 | compare %f

// ASSERT: scan-begin __cj_sanitizer_weak_hook_memcmp func

// ASSERT: scan-begin __cj_sanitizer_weak_hook_memcmp func
// ASSERT: scan-next string1: test
// ASSERT: scan-next string2: t1t1
// ASSERT: scan-next size: 4
// ASSERT: scan-next __cj_sanitizer_weak_hook_memcmp func
// ASSERT: scan-next string1: tesv
// ASSERT: scan-next string2: t2t2
// ASSERT: scan-next size: 4
// ASSERT: scan-next __cj_sanitizer_weak_hook_memcmp func
// ASSERT: scan-next string1: tess
// ASSERT: scan-next string2: t3t3
// ASSERT: scan-next size: 4
// ASSERT: scan-next __cj_sanitizer_weak_hook_memcmp func
// ASSERT: scan-next string1: test
// ASSERT: scan-next string2: t4t4
// ASSERT: scan-next size: 4
// ASSERT: scan-next __cj_sanitizer_weak_hook_memcmp func
// ASSERT: scan-next string1: tesv
// ASSERT: scan-next string2: t5t5
// ASSERT: scan-next size: 4
// ASSERT: scan-next __cj_sanitizer_weak_hook_memcmp func
// ASSERT: scan-next string1: tesv
// ASSERT: scan-next string2: tese
// ASSERT: scan-next size: 4
// ASSERT: scan-next __cj_sanitizer_weak_hook_memcmp func
// ASSERT: scan-next string1: tess
// ASSERT: scan-next string2: t6t6
// ASSERT: scan-next size: 4
// ASSERT: scan-end

func f1(s1: String, s2: String, s3: String): String {
    if (s1 == "t1t1") {
        return s1
    }
    if (s2.startsWith("t2t2")) {
        return s2
    }
    if (s3.endsWith("t3t3")) {
        return s2
    }
    if (s1.indexOf("t4t4", 0) != None) {
        return s3
    }
    if (s2.replace("t5t5", "sese") == "tese") {
        return s3
    }
    if (s3.contains("t6t6")) {
        return s3
    }
    return ""
}

main() {
    f1("test", "tesv", "tess")
    0
}
