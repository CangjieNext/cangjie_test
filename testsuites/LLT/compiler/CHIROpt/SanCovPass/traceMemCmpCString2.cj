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

// ASSERT: scan-begin __cj_sanitizer_weak_hook_strcmp func
// ASSERT: scan-next string1: east
// ASSERT: scan-next string2: west
// ASSERT: scan-next __cj_sanitizer_weak_hook_memcmp func
// ASSERT: scan-next string1: west
// ASSERT: scan-next string2: noth
// ASSERT: scan-next size: 4
// ASSERT: scan-next __cj_sanitizer_weak_hook_strncmp func
// ASSERT: scan-next string1: east
// ASSERT: scan-next string2: noth
// ASSERT: scan-next size: 4
// ASSERT: scan-next __cj_sanitizer_weak_hook_strcmp func
// ASSERT: scan-next string1: noth
// ASSERT: scan-next string2: east
// ASSERT: scan-next __cj_sanitizer_weak_hook_strcasecmp func
// ASSERT: scan-next string1: west
// ASSERT: scan-next string2: noth
// ASSERT: scan-end

func f2(s1: CString, s2: CString, s3: CString): CString {
    if (s1.equals(s2)) {
        return s1
    }
    if (s2.startsWith(s3)) {
        return s2
    }
    if (s1.endsWith(s3)) {
        return s1
    }
    if (s3.compare(s1) == 0) {
        return s3
    }
    if (s2.equalsLower(s3)) {
        return s3
    }
    return s1
}

main() {
    unsafe {
        let a: CString = LibC.mallocCString("east")
        let b: CString = LibC.mallocCString("west")
        let c: CString = LibC.mallocCString("noth")
        f2(a, b, c)
    }
    0
}
