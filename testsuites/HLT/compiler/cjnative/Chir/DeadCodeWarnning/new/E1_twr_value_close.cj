// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E1_twr_value_close] 清理调用可产生值时后继保持可达
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.5 E1 try-with-resources.6（隐式生命周期调用结果可产生值 → 不因可能抛异常推断后继不可达）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

class GoodRes <: Resource {
    public func isClosed(): Bool { false }
    public func close(): Unit { println("closed") }
}

main() {
    try (r = GoodRes()) {
        println("using")
    }
    println("reachable after twr")
}
