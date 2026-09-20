// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C7_enum_selector] const enum tag selector
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C7
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_unreachable_pattern"

enum State {
    | Ready
    | Stopped
}

main() {
    const state = State.Ready
    match (state) {
        case Ready => println("ready")
        case Stopped => println("stopped")
    }
}
