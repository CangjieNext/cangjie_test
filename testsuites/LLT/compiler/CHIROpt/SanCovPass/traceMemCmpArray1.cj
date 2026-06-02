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

// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [20,9].
// ASSERT: scan [SanitizerCoverage] Add trace Memory Compare at [27,9].
// ASSERT: scan-not error

internal import std.collection.ArrayList

func f3(a: Array<Int64>, b: Array<Int64>): Bool {
    if (a == b) {
        return true
    }
    return false
}

func f4(a: ArrayList<UInt16>, b: ArrayList<UInt16>): Bool {
    if (a == b) {
        return true
    }
    return false
}

main() {
    var arr1: Array<Int64> = [1, 2, 3]
    var arr2: Array<Int64> = [2, 3, 4]
    f3(arr1, arr2)
    let arrList1 = ArrayList<UInt16>([3, 2, 1])
    let arrList2 = ArrayList<UInt16>([4, 3, 2])
    f4(arrList1, arrList2)
    0
}
