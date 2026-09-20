// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FB9_iflet_and_false_block_dead] 边界对照: if-let && false 条件体死臂警告正确
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 假阳性猎捕边界对照 FB9; 探针: 新旧 SDK 均 1 条 block, 运行期打印 e → 体不执行=警告正确; if-let 条件用 && 连接(非 where), guard false 在此形态折叠正确, 钉 A
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    if (let Some(x) <- Option<Int64>.Some(3) && false) {
        println("t")
    } else {
        println("e")
    }
}
