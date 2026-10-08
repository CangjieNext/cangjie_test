// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FB7_elvis_some_rhs_dead] 边界对照: elvis const-Some LHS 报 RHS 正确
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 假阳性猎捕边界对照 FB7; 探针: 新旧 SDK 均 1 条报 RHS, 运行期打印 3; LHS 为 Some→RHS 被跳过=警告正确; 与 FP12 成对钉死 elvis 极性: 报 RHS 对/报 LHS 错, 钉 A
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression"

main() {
    let o: Option<Int64> = Some(3)
    let v = o ?? 9
    println(v)
}
