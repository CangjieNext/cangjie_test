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
// BLOCKED（设计项 LM-DOC-20260910：T202/T203；T201 参数模式维度）：
// 本 SDK（0907）std.core 缺失 String(Collection<Rune> @local?) 构造重载
// （仅有 Array<Rune> 重载且其符号未定义，传 Collection 或 widen 的 Rune 数组均
// 编译失败）。T203 的非 Array Collection 分支在当前源码中也是实现缺口（blocked
// positive，不是合法负例）。期望保持 doc-correct：两个构造都应编译成功且返回
// String @local!，值/bytes 精确。SDK 对齐源码后恢复 EXEC。
import std.collection.*

main(): Int64 {
    var failed = 0
    // T202: Array-backed Collection<Rune> @local? → String @local!
    let srcR: Array<Rune> @local! = [r'A', r'\u{00A2}']
    let coll: Collection<Rune> @local? = srcR
    let s: String @local! = String(coll)
    failed += assertB(s == "A¢", "T202_collection_value")
    failed += assertEq(s.size, 3, "T202_collection_size")
    // T201: QH Rune 数组直接入参
    let heapRunes: Array<Rune> = [r'x', r'y']
    let qr: Array<Rune> @local? = heapRunes
    let s2: String @local! = String(qr)
    failed += assertB(s2 == "xy", "T201_qh_runeArray")
    // T203: 非 Array Collection（heap ArrayList widen QH）规范正例
    let al = ArrayList<Rune>([r'A', r'\u{00A2}'])
    let qc: Collection<Rune> @local? = al
    let s3: String @local! = String(qc)
    failed += assertB(s3 == "A¢", "T203_nonArray_value")
    if (failed > 0) { println("${failed} test(s) FAILED"); return 1 }
    println("ALL PASSED")
    return 0
}
