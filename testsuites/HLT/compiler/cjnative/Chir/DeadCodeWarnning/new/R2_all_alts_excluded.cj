// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [R2_all_alts_excluded] 全部 alternatives 被排除合并为一条
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: §4.3 R2（跨 constructor 两个 alternatives 归入同一 case → 1 条; 本 SDK 报 sema_nonexhuastive_patterns error 形态差异 → Tier-B）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_unreachable_pattern"

enum Mode {
    | Left(Int64)
    | Right(Int64)
    | Done
}

main() {
    const mode = Mode.Done
    match (mode) {
        case Left(1) | Right(1) => println("0")
        case Done => println("1")
    }
}
