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
// ASSERT: scan-next 1 2 3
// ASSERT: scan-next size: 12
// ASSERT: scan-next __cj_sanitizer_weak_hook_memcmp func
// ASSERT: scan-next 3 2 1
// ASSERT: scan-next size: 12
// ASSERT: scan-end

internal import std.collection.ArrayList

func f3(a: Array<Int32>, b: Array<Int32>): Bool {
    if (a == b) {
        return true
    }
    return false
}

func f4(a: ArrayList<Int32>, b: ArrayList<Int32>): Bool {
    if (a == b) {
        return true
    }
    return false
}

main() {
    var arr1: Array<Int32> = [1, 2, 3]
    var arr2: Array<Int32> = [2, 3, 4]
    f3(arr1, arr2)
    let arrList1 = ArrayList<Int32>([3, 2, 1])
    let arrList2 = ArrayList<Int32>([4, 3, 2])
    f4(arrList1, arrList2)
    0
}
