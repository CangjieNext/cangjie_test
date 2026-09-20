// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FP13_elvis_none_both_sides_execute] elvis const-None: LHS 与 RHS 运行期双侧执行仍报 LHS
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: 假阳性猎捕 FP13; 探针: 新旧 SDK 均 1 条报 LHS, 运行期打印 rhs-runs 5 → LHS 读值与 RHS 调用双侧执行, 无一不可达; 真口径 0 条 scan_not() → 红=bug 留证; 运行期证据强于 FP12(RHS 也实测执行)
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

func fallback(): Int64 {
    println("rhs-runs")
    return 5
}

main() {
    let o: Option<Int64> = None
    // 假阳性位点: o (chir_dce_unreachable_expression) — 双侧均执行(rhs-runs 5)
    let v = o ?? fallback()
    println(v)
}
