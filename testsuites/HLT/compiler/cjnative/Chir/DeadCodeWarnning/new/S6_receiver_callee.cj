// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S6_receiver_callee] receiver/callee 产生 Nothing
// XFAIL(version-gate): 完整工具链口径; 本地 1.3.0-alpha 实测形态差异或 0 warning,
// 不完整工具链上按跳过语义运行, 不得判 FAIL。
// 规格: §4.1 S6（receiver/callee Nothing 使显式实参形成未求值后缀; 编译期即报 sema_unexpected_return_type_for_entry（新旧 SDK 同为 error 形态）→ Tier-B 编译错误门控）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression"

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }

extend Nothing {
    func consume(value: Int64) {}
}

main() {
    stop().consume(next())
    stop()(next())
}
