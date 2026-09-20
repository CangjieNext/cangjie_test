// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [X4_body_no_recursion] 整体不可达 case body 内嵌 match/if 不递归
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: dt-design 模块间接口2 用例3（unreachable_case_body_no_recursion 形态: 只报外层 case, body 内不产生二级 warning; 2026-09-20 新 SDK 对 body 内嵌 match 的 unreachable case 递归报告(实测 2 sema+1 hint) → 与官方注释语义相悖的潜在过度诊断, 保持官方口径 Tier-B 留证）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

main() {
    match (1) {
        case _ => println("outer first")
        case 2 =>
            match (9) {
                case _ => println("inner")
                case 8 => println("inner covered")
            }
    }
}
