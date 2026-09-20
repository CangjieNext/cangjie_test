// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FP14_elvis_stale_reassign] var 重赋值后陈旧折叠: elvis LHS 仍被报
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: 假阳性猎捕 FP14(陈旧 const 传播); 探针: 新旧 SDK 均 1 条报 LHS o, 运行期打印 3 → o 实为 Some, LHS 读值执行; 编译器按 init 值 None 折叠忽略重赋值=陈旧; 真口径 0 条 scan_not() → 红=bug 留证; 同根对照 K2(重赋值为 None)仍报 LHS, 证明报 LHS 与值无关, 根因=LHS 求值不可跳过(FP12)
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

main() {
    var o = Option<Int64>.None
    o = Option<Int64>.Some(3)
    // 假阳性位点: o (chir_dce_unreachable_expression) — 运行期 v=3(LHS 为 Some, 读值执行)
    let v = o ?? 9
    println(v)
}
