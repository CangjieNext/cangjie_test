/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXPECTED-COMPILE-FAIL: T332 ArrayList @local? receiver has no zip overload
// EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// EXEC: %run %run_opt %output %run_args
//
// LM-DOC-20260910 T332/T399: a q receiver is forbidden even though the
// document permits a bang receiver with local!/q/heap other modes.  Keep this
// negative compile unit independent from q-other blocked-positive probes.

import std.collection.*
import std.core.*

main(): Int64 {
    let leftSource: Array<Int64> @local! = [1]
    let rightSource: Array<String> @local! = ["a"]
    let left: ArrayList<Int64> @local? = ArrayList<Int64>(leftSource) @local!
    let right: ArrayList<String> @local! = ArrayList<String>(rightSource) @local!
    let invalid: ArrayList<(Int64, String)> @local! = left.zip(right)
    println(invalid.size)
    return 0
}
