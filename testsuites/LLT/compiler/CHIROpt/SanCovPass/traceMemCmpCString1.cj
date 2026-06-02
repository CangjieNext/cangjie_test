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

// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [21,9].
// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [24,9].
// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [27,9].
// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [30,9].
// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [33,9].
// ASSERT: scan-not error

func f2(s1: CString, s2: CString, s3: CString): CString {
    if (s1.equals(s2)) {
        return s1
    }
    if (s1.startsWith(s2)) {
        return s2
    }
    if (s1.endsWith(s2)) {
        return s1
    }
    if (s1.compare(s2) == 0) {
        return s3
    }
    if (s3.equalsLower(s1)) {
        return s3
    }
    return s1
}

main() {
    unsafe {
        let a: CString = LibC.mallocCString("test")
        let b: CString = LibC.mallocCString("test2")
        let c: CString = LibC.mallocCString("test3")
        f2(a, b, a)
    }
    0
}
