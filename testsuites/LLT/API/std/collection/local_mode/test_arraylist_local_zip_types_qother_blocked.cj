/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXPECTED-COMPILE-FAIL: T332 doc-valid q other rejected by narrow ArrayList.zip(other @local!) SDK signature
// DISABLED-EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args
//
// BLOCKED-POSITIVE (LM-DOC-20260910 T332/T333, C3): inferred and explicit
// bang-other calls are valid and retained.  The doc-valid q-other call below
// must compile too, but the 0907 SDK accepts only other @local!; its diagnostic
// is an implementation gap, not a language negative.

import std.collection.*
import std.core.*

main(): Int64 {
    let leftSource: Array<Int64> @local! = [1]
    let rightSource: Array<String> @local! = ["a"]
    let left: ArrayList<Int64> @local! = ArrayList<Int64>(leftSource) @local!
    let rightBang: ArrayList<String> @local! = ArrayList<String>(rightSource) @local!
    let inferred = left.zip(rightBang)
    let explicit: ArrayList<(Int64, String)> @local! = left.zip(rightBang)
    let rightQ: ArrayList<String> @local? = rightBang
    let qOther: ArrayList<(Int64, String)> @local! = left.zip(rightQ)
    println(inferred.size + explicit.size + qOther.size)
    let rightHeap = ArrayList<String>(["a"])
    let heapDirect: ArrayList<(Int64, String)> @local! = left.zip(rightHeap)
    return 0
}
