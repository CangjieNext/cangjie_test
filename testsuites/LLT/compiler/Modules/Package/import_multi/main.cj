// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt p.cj -o p.%middle
// EXEC: %compiler %cmp_opt p.%middle %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan f1
// ASSERT: scan f2
// ASSERT: scan f3
// ASSERT: scan f4
// ASSERT: scan f5
// ASSERT: scan f6

internal import pkg.{f1}
internal import pkg.{f2 as s2}
internal import pkg.{f3, f4}
internal import pkg.{f5 as s5, f6 as s6}

main(): Int64 {
    f1()
    s2()
    f3()
    f4()
    s5()
    s6()
    0
}
