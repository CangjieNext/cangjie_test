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
// BLOCKED (compiler + std message): T319/P354, C3.  ArrayList @local? reserve must
// grow when free < additional.  Growing needs to rebind the non-Copyable myData
// member, which the compiler forbids outside the constructor, so std throws
//   UnimplementedException(localGrowUnsupportedMessage("reserve"))
// (collection/array_list.cj; helper at :3319).  Two separate defects here:
//   1. the growth itself is unimplemented for a @local? receiver;
//   2. the message tells the caller to convert via `Array.cloneToLocal`, but that
//      function is `internal` as of 2026-09-29 (core/array.cj:1826) and raises
//      "no matching function declaration" for a user, so the advice is unactionable.
//      The documented public route is Array.clone(this @local?): Array<T> @local?
//      (spec line 473), which still yields @local? and so cannot be rebound to a
//      @local! field either.
// No-grow boundaries (0 / negative / exactly free) are covered by
// test_arraylist_copyable_extension.cj.
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
