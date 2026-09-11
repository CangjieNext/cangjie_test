/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXPECTED-COMPILE-FAIL: String @local? 实参传给 plain String（@~local）参数 —— 应报 mode 不匹配
// DISABLED-EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args
//
// 设计项 LM-DOC-20260910：T221。
main(): Int64 {
    let recv: String @local! = "A"
    let heap: String = "-"
    let p: String @local? = heap
    let r: String @local! = recv.padStart(4, padding: p)
    println(r.size)
    return 0
}
