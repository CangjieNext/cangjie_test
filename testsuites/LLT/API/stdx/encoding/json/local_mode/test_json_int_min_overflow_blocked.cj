/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
// UPDATE 2026-09-21: 本地重建 stdx (feat-stdx-json-local-mode-session) 提供 JSON local surface；0917 SDK 实证通过，恢复 EXEC。
// Evidence 2026-09-21: cjc+run ALL PASSED — 0917 SDK std Int64 exclave toString 已按 @OverflowWrapping 处理 Int64.Min，T503 不再复现。
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// EXEC: %set_stdx_path %run %run_opt %output %run_args
//
// BLOCKED（设计项 LM-DOC-20260910：T503）：Int64.Min 必须序列化为
// "-9223372036854775808"。SDK local_mode-localmods-20260911-final 的
// JsonInt.toString(this @local?) 在 Int64.Min 上抛 OverflowException: sub
// （stdx json_object.cj:413 对 Int64.Min 取负溢出）——真实实现缺陷，
// 本文件按 doc-correct 期望保留，修复后恢复 EXEC。其余 T502/T503/T505 行
// 已在 test_json_scalar_local.cj 活跃验证。
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
