// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FP3_bool_selector_guard_false] bool selector 同族假报
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: 假阳性猎捕 FP3(bool selector); 探针: 新 2 条/运行期打印 b; 真口径 1 条 scan-1 → 红=bug 留证; selector 类型广度: bool 同 Int 触发
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_unreachable_pattern"

main() {
    match (true) {
        case true where false => println("g")
        case _ => println("b")
    }
}
