// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:  ./koo
// EXEC: %compiler -p "koo" --mock=off --coverage -o koo.%suffix %cmp_utest_opt
// EXEC: %compiler -p "koo" --output-type=staticlib --mock=off --coverage -o libkoo.a
// EXEC: %compiler -L . -lkoo main.cj --mock=off --coverage -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt koo.%suffix %run_utest_opt %run_args 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: regex-not profiling .* cannot merge pervious GCDA file
// ASSERT: regex-not cannot merge previous run count
package test

internal import test.koo.*

main(): Int64 {
    let res = k
    println(res)
    let res2 = concatM("a", "b")
    println(res2)
    return 0
}

public func concatM(s1: String, s2: String): String {
    return s1 + s2
}
