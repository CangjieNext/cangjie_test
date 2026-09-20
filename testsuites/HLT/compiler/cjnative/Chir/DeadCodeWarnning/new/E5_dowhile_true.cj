// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E5_dowhile_true] do-while(true) 全转移
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.5 E5（N7 不适用 do-while; return 必须为 body 顺序语句——分支内 return 保留 CFG 边不适用本条; 2026-09-20 新 SDK 实测 1 条与本断言一致，升 A）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func value(): Int64 {
    do {
        return 0
    } while (true)
    return 1
}

main() {
    println(value())
}
