// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [B2_blackbox_cond] blackBox 隐藏条件常量——0 warning 负向
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 规格 §5.12 blackBox（编译器绝不对其返回值做假设 → if 条件对 DCE 不可见, then 块保留 0 warning; 与 C2_while_false/C1_bool_literal 的裸常量条件构成对照——唯一差异是 blackBox 包裹; 1.3.0-alpha 探针实测 0 warning 且运行期不输出 kept by blackBox）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

import std.runtime.*

func f(): Int64 {
    if (blackBox(false)) {
        println("kept by blackBox")
    }
    return 0
}

main() {
    println(f())
}
