// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FP12_elvis_none_lhs] elvis ?? const-None LHS 被报 unreachable(LHS 求值不可跳过)
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: 假阳性猎捕 FP12(elvis 极性反转); 探针: 新旧 SDK 均 1 条报 LHS o, 运行期打印 5 → LHS 被求值(?? 语义: 先求 LHS 再决定); LHS 永不可达=告警极性错(对照: const-Some LHS 报 RHS 才正确, 见 FB7); 真口径 0 条 scan_not() → 红=bug 留证; 函数调用 LHS 不报(Z1)仅 var 读报, 形态窄
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

main() {
    let o: Option<Int64> = None
    // 假阳性位点: o (chir_dce_unreachable_expression) — LHS 读值不可跳过, 运行期 v=5
    let v = o ?? 5
    println(v)
}
