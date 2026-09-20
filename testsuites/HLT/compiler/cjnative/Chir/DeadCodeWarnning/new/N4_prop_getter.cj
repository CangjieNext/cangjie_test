// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [N4_prop_getter] 属性 getter 未知
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.6 N4
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

class TextHolder {
    let text: String

    init(text: String) {
        this.text = text
    }

    prop size: Int64 {
        get() { text.size }
    }
}

main() {
    let holder = TextHolder("one")
    if (holder.size == 5) {
        println("property branch")
    }
}
