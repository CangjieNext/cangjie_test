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
// BLOCKED (LM-DOC-20260910 T318/T319, C3+RT-1): q receiver add×4/reserve 的
// doc-correct 正向期望。0907 SDK 前端无 q-receiver add 重载（mismatched types
// @24 编译即停）；即便编译通过，写入仍需 local-object write barrier 修复
// （RT-1）。不得接受占位 UnImplementedException 作为成功。
// 夹具按设计 T318：capacity=8、初值 [1,4]（add(1)+add(4) 构造）；四个重载
// 均为 no-grow（size≤8），capacity 不变量为精确 ==8。

import std.collection.*
import std.core.*

// 设计 T318 夹具：capacity=8、初值 [1,4]
func makeInitial(): ArrayList<Int64> @local? {
    let a: ArrayList<Int64> @local? = ArrayList<Int64>(8) @local!
    a.add(1)
    a.add(4)
    return a
}

class HeapSourceCollection <: Collection<Int64> {
    let items: Array<Int64>
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
    let heapCustom = HeapSourceCollection([2, 3])
    let qCustom: Collection<Int64> @local? = heapCustom
    failed += assertEq(t318AddAll(makeInitial(), qCustom), 0, "T318_q_add_all_custom")

    // T318: q add(all, at:1) 来源 Array → [1,2,3,4]
    let srcAt: Array<Int64> @local! = [2, 3]
    failed += assertEq(t318AddAllAt(makeInitial(), srcAt), 0, "T318_q_add_all_at_array")

    // T319: reserve no-op 边界（0/负/恰好 free=6）与增长（free<additional）
    // 夹初值 [1,4] 在 capacity8 上 free=6
    failed += assertEq(t319Reserve(makeInitial(), 0), 0, "T319_reserve_zero")
    failed += assertEq(t319Reserve(makeInitial(), -1), 0, "T319_reserve_negative")
    failed += assertEq(t319Reserve(makeInitial(), 6), 0, "T319_reserve_exact_free")
    failed += assertEq(t319Reserve(makeInitial(), 7), 0, "T319_reserve_growth_doc_correct")

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
