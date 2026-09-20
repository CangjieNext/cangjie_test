// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E10_catch_try_value] try 表达式作值时 catch 不可达仍报告
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 规格 §12 try 表达式（try 有值形态下 catch 块不可达判定与语句形态一致; 1.3.0-alpha 探针 L6C17 实测）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_useless_exception_type"

main() {
    let x = try {
        1
    } catch (e: Exception) {
        0
    } catch (e: Exception) {
        2
    }
    println(x)
}
