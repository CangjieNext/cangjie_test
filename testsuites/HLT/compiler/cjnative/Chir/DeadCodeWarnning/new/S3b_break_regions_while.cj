// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S3b_break_regions_while] while 循环内 continue/break 后独立区域
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S3 同构（while 形态两个独立区域各 1 条; 同函数双 while(true) 时 SDK 第二区域缺报 → 拆函数形态实测 2 条; 官方 nothing_loop 同构口径）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"

func contRegion() {
    while (true) {
        continue
        println("dead c")
    }
}

func breakRegion() {
    while (true) {
        break
        println("dead b")
    }
}

main() {
    contRegion()
    breakRegion()
}
