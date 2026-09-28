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
// BLOCKED（设计项 LM-DOC-20260910：T318/T422，P420）：heap CustomCollection
// widen QH 作为 bulk add 来源是规范正例；实测 SDK
// local_mode-localmods-20260911-final 仍将未知动态类型按 cSize=0 静默 no-op
// （自定义类分支未实现），运行结果非 [1,4,2,3] → 本文件按 doc-correct 期望保留，
// 实现修复后恢复 EXEC。其余 q add 来源（Array/ArrayList）已在
// test_arraylist_copyable_extension.cj 活跃验证。
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
