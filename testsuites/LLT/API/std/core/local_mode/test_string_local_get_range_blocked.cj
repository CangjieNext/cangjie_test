/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// UPDATE 2026-09-11: SDK local_mode-localmods-20260911-final 已修复本文件原阻塞器，恢复 EXEC（原阻塞记录见下）。
// EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// EXEC: %run %run_opt %output %run_args
//
// BLOCKED（设计项 LM-DOC-20260910：T229/T230）：本 SDK std.core 缺失
// String[](Range<Int64>) 的 local!/local? 重载（链接期 undefined
// _CNat6StringixHW{L,l}ERNat5RangeIlE）。期望保持 doc-correct：local! receiver
// 结果绑定 String @local!，local? receiver 结果绑定 String @local?；step!=1 →
// IllegalArgumentException；越界 → IndexOutOfBoundsException；continuation 起点/
// 终点 → IllegalArgumentException。SDK 对齐后恢复 EXEC。
main(): Int64 {
    var failed = 0
    let sL: String @local! = "A¢仓\u{1F600}"
    let subL: String @local! = sL[1..3]
    failed += assertB(subL == "¢", "T229_localBang_value")
    let sQ: String @local? = "A¢仓\u{1F600}"
    let subQ: String @local? = sQ[3..6]
    failed += assertB(subQ == "仓", "T229_localQ_value")
    let subC: String @local? = sQ[1..=2]
    failed += assertB(subC == "¢", "T229_closed_value")
    let neg: Int64 = -1
    try { let _ = sQ[neg..3]; failed += 1; println("FAIL: T230_negStart") }
    catch (e: IndexOutOfBoundsException) {}
    let stepRange: Range<Int64> = Range(0, 6, 2, true, true, false)
    try { let _ = sQ[stepRange]; failed += 1; println("FAIL: T230_step2") }
    catch (e: IllegalArgumentException) {}
    let contStart: Int64 = 2
    try { let _ = sQ[contStart..3]; failed += 1; println("FAIL: T230_contStart") }
    catch (e: IllegalArgumentException) {}
    if (failed > 0) { println("${failed} test(s) FAILED"); return 1 }
    // T229: 省略 end 的 [6..] 与空区间 [3..3]
    let openEnd: String @local? = sQ[6..]
    failed += assertB(openEnd == "\u{1F600}", "T229_openEnd_value")
    let emptyRange: String @local? = sQ[3..3]
    failed += assertB(emptyRange == "", "T229_emptyRange_value")
    // T230: [3..11] 越界与 [1..2] end-continuation
    let oobEnd: Int64 = 11
    try { let _ = sQ[3..oobEnd]; failed += 1; println("FAIL: T230_oobEnd") }
    catch (e: IndexOutOfBoundsException) {}
    try { let _ = sQ[1..2]; failed += 1; println("FAIL: T230_endContinuation") }
    catch (e: IllegalArgumentException) {}
    println("ALL PASSED")
    return 0
}
