/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// EXEC: %set_stdx_path %run %run_opt %output %run_args
//
// LM-DOC-20260910: T503.  Int64.Min must serialize as
// "-9223372036854775808" (JSON has no signed-zero/negation ambiguity).
// UPDATE 2026-09-21: cjc+run ALL PASSED — 0917 SDK std Int64 exclave toString
// 已按 @OverflowWrapping 处理 Int64.Min，原 json_object.cj 取负溢出缺陷不再复现。
// 其余 T502/T503/T505 行已在 test_json_scalar_local.cj 活跃验证。
import stdx.encoding.json.*

main(): Int64 {
    var failed: Int64 = 0
    let value: JsonInt @local! = JsonInt(Int64.Min) @local!
    if (value.getValue() != Int64.Min) { failed += 1; println("FAIL: T503_int_min_getValue") }
    if (value.toString() != "-9223372036854775808") { failed += 1; println("FAIL: T503_int_min_toString") }
    if (value.toJsonString() != "-9223372036854775808") { failed += 1; println("FAIL: T503_int_min_toJsonString") }
    if (failed > 0) { println("${failed} test(s) FAILED"); return 1 }
    println("ALL PASSED")
    return 0
}
