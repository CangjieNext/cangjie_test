// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S6_bare_last_arg_zero] 裸调用末位 Nothing 实参且无后继
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S6 裸调用零边界（末位后缀不存在且无块内后继; 2026-09-20 新 SDK 实测 1 条 chir_dce_unreachable@call 根——与官方 nothing_middle_last_argument 的 call 根结构一致, 旧 0911 实测 0; 官方无纯零警告裸调用先例, 以新 SDK+官方结构定口径）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable"

func stop(): Nothing { throw Exception() }
func consume(first: Int64, second: Int64, third: Int64): Int64 { first + second + third }

main() {
    consume(1, 2, stop())
}
