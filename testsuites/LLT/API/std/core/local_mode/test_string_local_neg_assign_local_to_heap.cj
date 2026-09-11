/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// EXPECTED-COMPILE-FAIL: String @local! 直接赋给 heap String 槽 —— 非 Copyable 收窄，应报 mode 不匹配
// DISABLED-EXEC: %compiler %cmp_opt ./local_mode_utils.cj %f -o %output
// DISABLED-EXEC: %run %run_opt %output %run_args
//
// 设计项 LM-DOC-20260910：T206。旁证正例：String(local!) heap 拷贝构造合法。
main(): Int64 {
    let src: String @local! = "L"
    let bad: String = src
    println(bad.size)
    return 0
}
