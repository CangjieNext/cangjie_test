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
// BLOCKED (std, not yet implemented): T318/T422, P420.  A heap CustomCollection
// widened to Collection<Int64> @local? is the documented positive source for bulk
// add, but both add(all:) branches in std only specialise Array<T> and
// ArrayList<T> and fall through to
//   case _ => throw IllegalArgumentException("Unsupported collection type for @local? add.")
// (collection/array_list.cj:3227; the @local! branch does the same at :516), so the
// custom collection never contributes.  A custom source cannot be widened to
// Collection<Int64> @local! either (only @local? accepts a heap origin), so there is
// no way to reach the generic path from a test.  Restore EXEC when the branches
// handle an arbitrary Collection (e.g. via toArray()).
// Other bulk-add sources (Array/ArrayList) are covered by
// test_arraylist_copyable_extension.cj.
import std.collection.*
import std.core.*

class HeapSourceCollection <: Collection<Int64> {
    let items: Array<Int64>
    init(items: Array<Int64>) { this.items = items }
    public func iterator(): Iterator<Int64> { items.iterator() }
    public prop size: Int64 {
        get() { items.size }
    }
    public func isEmpty(): Bool { items.size == 0 }
    public func toArray(): Array<Int64> { items }
}

exclave func makeInitial(): ArrayList<Int64> @local? {
    let a: ArrayList<Int64> @local? = ArrayList<Int64>(8) @local!
    a.add(1)
    a.add(4)
    return a
}

func t318AddAll(a: ArrayList<Int64> @local?, source: Collection<Int64> @local?): Int64 {
    a.add(all: source)
    if (a.size != 4 || a[0] != 1 || a[1] != 4 || a[2] != 2 || a[3] != 3 || a.capacity != 8) { return 1 }
    0
}

main(): Int64 {
    var failed = 0
    let heapCustom = HeapSourceCollection([2, 3])
    let qCustom: Collection<Int64> @local? = heapCustom
    failed += assertEq(t318AddAll(makeInitial(), qCustom), 0, "T318_q_add_all_custom")
    if (failed > 0) { println("${failed} test(s) FAILED"); return 1 }
    println("ALL PASSED")
    return 0
}
