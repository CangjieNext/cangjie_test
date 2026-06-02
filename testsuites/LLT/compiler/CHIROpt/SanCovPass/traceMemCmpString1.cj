// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: sancov.h sancov.cpp
// (CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -c -fPIC %stdc++_opt sancov.cpp -o sancov.o
// (CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt --sanitizer-coverage-trace-memcmp sancov.o %n.cj -o %output  2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -shared -fPIC %stdc++_opt sancov.cpp -o libsancov.so
// (not CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt --sanitizer-coverage-trace-memcmp -o %n.%suffix %n.cj -lsancov 2>&1 | compare %f

// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [23,9].
// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [26,9].
// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [29,9].
// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [32,9].
// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [35,9].
// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [35,9].
// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [38,9].
// ASSERT: scan-not error

func f1(s1: String, s2: String, s3: String): String {
    if (s1 == "test") {
        return s1
    }
    if (s2.startsWith("te")) {
        return s2
    }
    if (s2.endsWith("st")) {
        return s2
    }
    if (s3.indexOf("te", 0) != None) {
        return s3
    }
    if (s3.replace("te", "se") == "tese") {
        return s3
    }
    if (s3.contains("te")) {
        return s3
    }
    return ""
}

main() {
    f1("test", "test", "test")
    0
}
