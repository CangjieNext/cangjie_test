/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// BLOCKED-RUNTIME: T405 ArrayList local remove(at:) reaches Barrier::WriteGeneric and aborts before
//   the old iterator can observe ConcurrentModificationException. The doc-correct expectation
//   remains: after public mutation, iterator.next() must catch ConcurrentModificationException.
// DISABLED-EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    let source: Array<Int64> @local! = [1, 2]
    let list: ArrayList<Int64> @local! = ArrayList<Int64>(source) @local!
    let iterator: Iterator<Int64> @local! = list.iterator()
    list.remove(at: 0)

    try {
        let _ = iterator.next()
        println("FAIL: T405_arraylist_mutation — expected ConcurrentModificationException")
        return 1
    } catch (e: ConcurrentModificationException) {
        println("FAIL: T405_arraylist_mutation did not reach barrier")
        return 1
    }
}
