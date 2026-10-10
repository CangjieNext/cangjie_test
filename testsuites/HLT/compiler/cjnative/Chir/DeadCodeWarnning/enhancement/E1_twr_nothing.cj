// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E1_twr_nothing] try-with-resources 清理无正常完成路径
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: §4.5 E1 try-with-resources.4（全部可达资源清理路径无正常完成 → 后继 1 条; 2026-09-20 新 SDK 实测 0 条(旧 0911 报 1)——close(): Nothing 使后继不可达但无警告, 潜在漏报, 保持规格口径 Tier-B 留证）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

class BadRes <: Resource {
    public func isClosed(): Bool { false }
    public func close(): Nothing { throw Exception() }
}

main() {
    try (r = BadRes()) {
        println("using")
    }
    println("dead after twr")
}
