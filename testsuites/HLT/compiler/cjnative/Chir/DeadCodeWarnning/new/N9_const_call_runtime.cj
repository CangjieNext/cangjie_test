// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [N9_const_call_runtime] const 函数非 const 上下文调用未知
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.6 N9（直接对象构造动态类型仍按 C18 参与 is 判断——本文件不含该形态，见 C18）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

const func currentValue(): Int64 { 1 }

main() {
    if (currentValue() < 0) {
        println("runtime const-call branch")
    }
}
