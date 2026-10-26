/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// EXEC: %run %run_opt %output %run_args
//
// BLOCKED (std, partially fixed): T318/T422, P420.  A heap CustomCollection
// widened to Collection<Int64> @local? is the documented positive source for bulk
// add, but the @local? paths still specialise only Array<T> and ArrayList<T>:
//
//   init(this @local?, Collection<T> @local?)   case _ => "...@local? ArrayList init."   (:311)
//   add(this @local!,  Collection<T> @local?)   case _ => "...@local? add."              (:3271)
//   add(this @local?,  Collection<T> @local?)   case _ => "...@local? add."              (:3271)
//
// UPDATE 2026-09-30 (std 3c5eba4a52): the @local! constructor now falls back to
// `elements.toArray()` and accepts an arbitrary Collection; the @local?-receiver
// paths above were not part of that change and still throw.  Verified: the
// @local? constructor raises "Unsupported collection type for @local? ArrayList
// init." and @local? add(all:) raises "Unsupported collection type for @local?
// add." on modal_type-20260928.
//
// This case drives the @local? path, so it stays disabled.  Restore EXEC when the
// @local? receiver handles an arbitrary Collection (e.g. via toArray()).
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
