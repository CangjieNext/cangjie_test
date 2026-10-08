// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [N8_param_dynamic_type] 形参动态类型与运行时 as 未知
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.6 N8
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

open class Base {}
class Derived <: Base {}

func check(value: Base) {
    if (value is Derived) {
        println("runtime subtype")
    }
}

main() {
    check(Derived())
    let value: Any = Derived()
    let converted = value as String
    if (let text <- converted) {
        println(text)
    }
}
