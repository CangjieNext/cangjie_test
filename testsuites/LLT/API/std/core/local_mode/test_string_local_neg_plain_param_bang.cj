/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXPECTED-COMPILE-FAIL: String @local! 实参传给 plain String（@~local）参数 —— 非 Copyable 不能收窄，padStart 的 padding 参数应报 mode 不匹配
// RUN-EXEC-PIPE-1: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output 2>&1 | compare %f
// DISABLED-EXEC: %run %run_opt %output %run_args
//
// 设计项 LM-DOC-20260910：T221（闭环 :43-50 默认参数统一为 @~local）。
// 旁证正例：heap 变量/字面量作为 padding 合法（test_string_local_default_param.cj T220）。
main(): Int64 {
    let recv: String @local! = "A"
    let p: String @local! = "-"
    let r: String @local! = recv.padStart(4, padding: p)
    println(r.size)
    return 0
}

/* SCAN-IN
error: mismatched types
  ==> test_string_local_neg_plain_param_bang.cj:19:55:
   | 
19 |     let r: String @local! = recv.padStart(4, padding: p)
   |                                                       ^ expected 'Struct-String', found 'Struct-String @local!'
   | 
*/
