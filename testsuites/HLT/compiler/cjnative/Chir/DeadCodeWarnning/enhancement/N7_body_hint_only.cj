// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [N7_body_hint_only] while(true): body 内 S 类照报、后继 0 warning
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.6 N7（组合断言: body 内 hint 恰 1 条 = S 类; 后继 3 无 warning——S1 与 N7 同文件正负双锚）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func value(): Int64 {
    while (true) {
        return 1
        2
    }
    3
}

main() {
    println(value())
}
