// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FB8_for_empty_range_body_dead] 边界对照: 空区间 for 体死臂警告正确
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 假阳性猎捕边界对照 FB8; 探针: 新旧 SDK 均 1 条 block, 运行期仅打印 after → 体确实不执行=警告正确; 假阳性猎捕轮的真阳性锚(编译器区间折叠能力本身在位), 钉 A
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    for (i in 0..0) {
        println("body")
    }
    println("after")
}
