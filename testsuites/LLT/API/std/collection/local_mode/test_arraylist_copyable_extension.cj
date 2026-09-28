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
// UPDATE 2026-09-11: SDK local_mode-localmods-20260911-final 已修复 C3（q add 重载）
// 与 RT-1（写屏障），本文件恢复 EXEC。唯一例外：heap CustomCollection bulk 来源
// 行移入 test_arraylist_local_customcollection_blocked.cj（P420 静默 no-op 缺口
// 在该 SDK 实测仍存在）。
// 原始阻塞记录（LM-DOC-20260910 T318/T319, C3+RT-1）： q receiver add×4/reserve 的
// doc-correct 正向期望。0907 SDK 前端无 q-receiver add 重载（mismatched types
// @24 编译即停）；即便编译通过，写入仍需 local-object write barrier 修复
// （RT-1）。不得接受占位 UnimplementedException 作为成功。
// 夹具按设计 T318：capacity=8、初值 [1,4]（add(1)+add(4) 构造）；四个重载
// 均为 no-grow（size≤8），capacity 不变量为精确 ==8。

import std.collection.*
import std.core.*

// 设计 T318 夹具：capacity=8、初值 [1,4]
exclave func makeInitial(): ArrayList<Int64> @local? {
    let a: ArrayList<Int64> @local? = ArrayList<Int64>(8) @local!
    a.add(1)
    a.add(4)
    return a
}

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

func t318Add(a: ArrayList<Int64> @local?): Int64 {
    a.add(9)
    if (a.size != 3 || a[0] != 1 || a[1] != 4 || a[2] != 9 || a.capacity != 8) { return 1 }
    0
}

func t318AddAt(a: ArrayList<Int64> @local?): Int64 {
    a.add(9, at: 1)
    if (a.size != 3 || a[0] != 1 || a[1] != 9 || a[2] != 4 || a.capacity != 8) { return 1 }
    0
}

func t318AddAll(a: ArrayList<Int64> @local?, source: Collection<Int64> @local?): Int64 {
    a.add(all: source)
    if (a.size != 4 || a[0] != 1 || a[1] != 4 || a[2] != 2 || a[3] != 3 || a.capacity != 8) { return 1 }
    0
}

func t318AddAllAt(a: ArrayList<Int64> @local?, source: Collection<Int64> @local?): Int64 {
    a.add(all: source, at: 1)
    if (a.size != 4 || a[0] != 1 || a[1] != 2 || a[2] != 3 || a[3] != 4 || a.capacity != 8) { return 1 }
    0
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

    // T318: q add(element)，capacity8 + [1,4] → [1,4,9]，capacity 不变
    failed += assertEq(t318Add(makeInitial()), 0, "T318_q_add_element")

    // T318: q add(element, at:1) → [1,9,4]
    failed += assertEq(t318AddAt(makeInitial()), 0, "T318_q_add_at")

    // T318: q add(all) 来源 Array → [1,4,2,3]
    let srcArray: Array<Int64> @local! = [2, 3]
    failed += assertEq(t318AddAll(makeInitial(), srcArray), 0, "T318_q_add_all_array")

    // T318: q add(all) 来源 ArrayList → 同合同
    let srcList: ArrayList<Int64> @local? = ArrayList<Int64>([2, 3]) @local!
    failed += assertEq(t318AddAll(makeInitial(), srcList), 0, "T318_q_add_all_arraylist")

    // T318: q add(all) 来源 heap CustomCollection widen QH（规范正例；实现缺口
    // 另记 P420/P422，不得因当前静默 no-op 改期望）
    // T318: q add(all, at:1) 来源 Array → [1,2,3,4]
    let srcAt: Array<Int64> @local! = [2, 3]
    failed += assertEq(t318AddAllAt(makeInitial(), srcAt), 0, "T318_q_add_all_at_array")

    // T319: reserve no-op 边界（0/负/恰好 free=6）与增长（free<additional）
    // 夹初值 [1,4] 在 capacity8 上 free=6
    failed += assertEq(t319Reserve(makeInitial(), 0), 0, "T319_reserve_zero")
    failed += assertEq(t319Reserve(makeInitial(), -1), 0, "T319_reserve_negative")
    failed += assertEq(t319Reserve(makeInitial(), 6), 0, "T319_reserve_exact_free")
    // SKIPPED: T319 q reserve 增长（free<additional）——编译器禁止 q 实例重绑
    // myData，SDK 实测抛 UnimplementedException（array_list.cj:3199），属
    // 设计 P354/C3 blocked-positive；doc-correct 期望见
    // test_arraylist_local_qgrow_blocked.cj。

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
