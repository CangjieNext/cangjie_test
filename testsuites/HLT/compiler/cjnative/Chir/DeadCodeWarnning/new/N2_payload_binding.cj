// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [N2_payload_binding] pattern 绑定 payload 未知
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.6 N2（Some 确定成功; 绑定出的 number 未知 → 0; 2026-09-20 新 SDK 实测 0 unreachable 与本断言一致，升 A；unused 族噪声与断言正交）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

func runtimeValue(): Int64 { 1 }

main() {
    let direct = Option<Int64>.Some(1)
    if (let Some(number) <- direct && number < 0) {
        println("payload condition")
    }

    let value = Option<Int64>.Some(runtimeValue())
    if (let Some(number) <- value && number < 0) {
        println("runtime payload condition")
    }
}
