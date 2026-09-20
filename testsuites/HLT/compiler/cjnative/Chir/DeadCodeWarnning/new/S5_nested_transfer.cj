// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S5_nested_transfer] 嵌套控制转移子表达式 return return
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: 规格 §4 表达式.md:837-841（控制转移表达式作子表达式可产生不可达代码——左 return 不可达, 规格示例 `return return 1 // warning: the left return expression is unreachable`）; 2026-09-20 新 SDK 实测 0 warning(旧 0911 报 2 条 hint) → 规格要求警告缺失 bug 证据: 运行期正常返回 1, 左 return 不可达却无警告; 保持规格口径 Tier-B 留证
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"

func nested(): Int64 {
    return return 1
}

func triple(): Int64 {
    return return return 2
}

main() {
    println(nested() + triple())
}
