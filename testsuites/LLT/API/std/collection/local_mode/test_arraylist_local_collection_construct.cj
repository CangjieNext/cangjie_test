/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXPECTED-COMPILE-FAIL: T302 Collection<T> @local! constructor overload is absent
// DISABLED-EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args
//
// BLOCKED (LM-DOC-20260910 T302, C5): the document requires
// ArrayList(Collection<String> @local!) for Array-backed and ArrayList-backed
// collections.  The 0907 SDK exposes only Array<T> @local!; keep both
// doc-correct positive calls here until that overload is exported.

import std.collection.*
import std.core.*

main(): Int64 {
    let sourceArray: Array<String> @local! = ["a", "b"]
    let arrayCollection: Collection<String> @local! = sourceArray
    let fromArray: ArrayList<String> @local! = ArrayList<String>(arrayCollection) @local!
    let sourceList: ArrayList<String> @local! = ArrayList<String>(sourceArray) @local!
    let listCollection: Collection<String> @local! = sourceList
    let fromList: ArrayList<String> @local! = ArrayList<String>(listCollection) @local!
    if (fromArray.size != 2 || fromList.size != 2) {
        return 1
    }
    println("ALL PASSED")
    return 0
}
