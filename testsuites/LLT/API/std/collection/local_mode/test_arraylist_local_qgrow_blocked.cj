/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// DISABLED-EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args
//
// BLOCKED（设计项 LM-DOC-20260910：T319/P354，C3）：ArrayList @local? 的
// reserve 在 free<additional 时必须扩容成功。编译器禁止 q 实例在构造外重绑
// 非 Copyable 成员 myData，SDK local_mode-localmods-20260911-final 实测抛
// UnimplementedException（array_list.cj:3199）——blocked positive，不得把该
// 异常当成功。修复（编译器放开 q 成员重绑）后恢复 EXEC。no-grow 边界
// （0/负/恰好 free）已在 test_arraylist_copyable_extension.cj 活跃验证。
import std.collection.*
import std.core.*

exclave func makeInitialGrow(): ArrayList<Int64> @local? {
    let a: ArrayList<Int64> @local? = ArrayList<Int64>(8) @local!
    a.add(1)
    a.add(4)
    return a
}

func t319Reserve(a: ArrayList<Int64> @local?, additional: Int64): Int64 {
    let before: Int64 @local? = a.capacity
    a.reserve(additional)
    let after: Int64 @local? = a.capacity
    if (after < before || after - a.size < additional) { return 1 }
    0
}

main(): Int64 {
    var failed = 0
    failed += assertEq(t319Reserve(makeInitialGrow(), 7), 0, "T319_reserve_growth_doc_correct")
    if (failed > 0) { println("${failed} test(s) FAILED"); return 1 }
    println("ALL PASSED")
    return 0
}
