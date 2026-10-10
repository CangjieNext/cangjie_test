// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [N1_runtime_call] 普通函数结果未知
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.6 N1（未知值 0 warning; M 类覆盖关系在 N1 场景仍生效——独立 M3 用例承载）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

func runtimeValue(): Int64 { 1 }

main() {
    let value = runtimeValue()
    if (value < 0) {
        println("runtime branch")
    }
}
