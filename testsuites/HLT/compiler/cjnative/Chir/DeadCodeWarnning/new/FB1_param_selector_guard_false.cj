// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [FB1_param_selector_guard_false] 边界对照: 未知 selector(param) 不假报后继
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 假阳性猎捕边界对照 FB1; 探针: 新 SDK 仅 1 条(guard), 后继不报=正确; 运行期打印 b; 证 FP1-FP8 以 const selector(含 const 传播)为触发前提, 未知 selector 免疫——与官方 match_guard_diagnostic_range(未知 args.size 仅报 guard)同口径, 钉 A
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_unreachable_pattern"

func classify(x: Int64) {
    match (x) {
        case 3 where false => println("g")
        case _ => println("b")
    }
}

main() {
    classify(3)
}
