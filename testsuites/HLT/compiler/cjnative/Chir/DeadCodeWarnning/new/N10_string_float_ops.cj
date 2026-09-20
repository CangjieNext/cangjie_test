// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [N10_string_float_ops] String 运算、Float 幂与用户 operator 未知
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.6 N10（String +/==/!=、Float ** 结果未知; String pattern 间覆盖关系仍按 M2）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

main() {
    let text = "a" + "b"
    if (text == "ab") {
        println("string branch")
    }

    const power: Float64 = 2.0 ** 3.0
    if (power < 0.0) {
        println("float branch")
    }
}
