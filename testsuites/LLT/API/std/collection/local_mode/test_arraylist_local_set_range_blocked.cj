/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ../../core/local_mode/local_mode_utils.cj
// DISABLED-EXEC: %compiler %cmp_opt ../../core/local_mode/local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args
//
// BLOCKED (LM-DOC-20260910 T314, C3): doc-correct local! and local? range
// removal (open/closed/omitted/empty/step/bounds/Max overflow) is retained,
// but the 0907 SDK links no local ArrayList.remove(Range) overload.

import std.collection.*
import std.core.*

func bangRanges(a: ArrayList<Int64> @local!): Int64 {
    exclave {
        a.remove(1..3)
        if (a.size != 3 || a[0] != 1 || a[1] != 4 || a[2] != 5) { return 1 }
        a.remove(1..=2)
        if (a.size != 1 || a[0] != 1) { return 1 }
        0
    }
}

func questionRanges(a: ArrayList<Int64> @local?): Int64 {
    a.remove(1..3)
    if (a.size != 3) { return 1 }
    a.remove(Range<Int64>(0, 0, 1, true, true, false))
    0
}

main(): Int64 {
    var failed = 0
    let source: Array<Int64> @local! = [1, 2, 3, 4, 5]
    let bang: ArrayList<Int64> @local! = ArrayList<Int64>(source) @local!
    failed += assertEq(bangRanges(bang), 0, "T314_bang_full_ranges")
    let sourceQ: Array<Int64> @local! = [1, 2, 3, 4, 5]
    let question: ArrayList<Int64> @local? = ArrayList<Int64>(sourceQ) @local!
    failed += assertEq(questionRanges(question), 0, "T314_question_ranges")
    // T314 expected errors (kept doc-correct even though link is blocked):
    // a.remove(0..4 : 2) -> IllegalArgumentException
    // a.remove(-1..1), a.remove(0..6) -> IndexOutOfBoundsException
    // a.remove(2..2), a.remove(Range<Int64>(0, 0, 1, true, true, false)) -> no-op
    // a.remove(Range<Int64>(0, Int64.Max, 1, true, true, true)) -> overflow
    if (failed > 0) { println("${failed} test(s) FAILED"); return 1 }
    println("ALL PASSED")
    return 0
}
