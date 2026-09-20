// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FB2_string_selector_guard_false] 边界对照: String selector 不假报后继
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 假阳性猎捕边界对照 FB2; 探针: 新 SDK 仅 1 条(guard), 运行期打印 b; String selector 不参与假报(对比 Int/bool/tuple/enum/unit)——假报与模式字面量折叠路径绑定, 钉 A
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_unreachable_pattern"

main() {
    match ("s") {
        case "s" where false => println("g")
        case _ => println("b")
    }
}
