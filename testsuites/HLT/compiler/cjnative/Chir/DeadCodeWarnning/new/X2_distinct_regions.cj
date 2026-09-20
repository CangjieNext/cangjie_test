// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [X2_distinct_regions] 同一函数内两个独立区域分别输出
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: dt-design 模块间接口1 用例2（异根分离, distinct_unreachable_regions 形态; 2026-09-20 新 SDK 实测 2 条与本断言一致，升 A）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"

func twoRoots(flag: Bool): Int64 {
    if (flag) {
        return 1
        println("root A")
        0
    }
    return 2
    println("root B")
    0
}

main() {
    println(twoRoots(true))
}
