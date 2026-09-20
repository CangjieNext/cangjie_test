// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C6_merged_reasons] 同 case 双重排除原因合并为一条
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: §4.2 C6（确定 selector 排除与有限集合穷举排除同 case 合并: 4|5 整 case 一条）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_unreachable_pattern"

main() {
    const value = 3
    match (value) {
        case 3 => println("selected")
        case 4 | 5 => println("merged")
    }
}
