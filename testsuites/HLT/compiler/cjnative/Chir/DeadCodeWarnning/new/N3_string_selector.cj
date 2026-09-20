// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [N3_string_selector] 普通函数/字面量 String selector 未知
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.6 N3（String 字面量与 const 初始化同样不提供 C6 确定值 → 0）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

func runtimeText(): String { "one" }

main() {
    let text = runtimeText()
    match (text) {
        case "two" => println("runtime case")
        case _ => println("fallback")
    }

    match ("literal") {
        case "a" => println("1")
        case _ => println("2")
    }
}
