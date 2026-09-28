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
// URL 文档 §19：编译器当前无法实现的形态，按「显式拒绝」契约断言——抛异常而不是
// 静默返回错误结果或丢失元素。前置事实（均经最小 repro 实测）：
//   1. Array 的 @local? 元素写入器 `[]=(this @local?, index, value!)` 位于
//      `extend<T> Array<T> where T <: Copyable`；HashMap 的 K/V 无该约束，因此
//      @local? 接收者读出的元素无法写入新数组/新表。（arraySet3 本身已无约束，
//      但它对 std.collection 不可达；带约束的是公开写入器与 arraySetUnchecked3。）
//   2. MapEntryView 接口要求 plain 的 key/value 属性，而本地视图必须持有
//      `@local!`/`@local?` 的 map 引用；字段不能标注 locality，接收者带 locality 时
//      字段写入又要求同局部性的值，故本地 entryView 视图无法构造。
//   3. Collection/EquatableCollection 接口未声明 local 的 size/contains，视图以
//      local 接口返回时只能走迭代与 local toArray。

import std.collection.*
import std.core.*

main(): Int64 {
    var failed = 0
    let m: HashMap<String, Int64> @local! = HashMap<String, Int64>() @local!
    m.add("a", 1)
    let q: HashMap<String, Int64> @local? = m

    // toArray(@local?)：显式拒绝
    var toArrayThrew = false
    try {
        let _: Array<(String, Int64)> @local? = q.toArray()
    } catch (e: Exception) {
        toArrayThrew = true
    }
    failed += assertB(toArrayThrew, "S19_limits_toarray_q_throws")

    // clone(@local?)：显式拒绝
    var cloneThrew = false
    try {
        let _: HashMap<String, Int64> @local? = q.clone()
    } catch (e: Exception) {
        cloneThrew = true
    }
    failed += assertB(cloneThrew, "S19_limits_clone_q_throws")

    // entryView(@local!)：显式拒绝
    var entryThrew = false
    try {
        let _: MapEntryView<String, Int64> @local! = m.entryView("a")
    } catch (e: Exception) {
        entryThrew = true
    }
    failed += assertB(entryThrew, "S19_limits_entryview_bang_throws")

    // entryView(@local?)：显式拒绝
    var entryQThrew = false
    try {
        let _: MapEntryView<String, Int64> @local? = q.entryView("a")
    } catch (e: Exception) {
        entryQThrew = true
    }
    failed += assertB(entryQThrew, "S19_limits_entryview_q_throws")

    // keys(@local?)/values(@local?) 的 local toArray 同样不可实现：显式拒绝
    let keysQ: EquatableCollection<String> @local? = q.keys()
    var keysToArrayThrew = false
    try {
        let _: Array<String> @local? = keysQ.toArray()
    } catch (e: Exception) {
        keysToArrayThrew = true
    }
    failed += assertB(keysToArrayThrew, "S19_limits_keys_q_toarray_throws")

    let valsQ: Collection<Int64> @local? = q.values()
    var valsToArrayThrew = false
    try {
        let _: Array<Int64> @local? = valsQ.toArray()
    } catch (e: Exception) {
        valsToArrayThrew = true
    }
    failed += assertB(valsToArrayThrew, "S19_limits_values_q_toarray_throws")

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
