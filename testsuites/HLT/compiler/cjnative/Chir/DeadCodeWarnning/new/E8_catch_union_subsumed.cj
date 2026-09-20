// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E8_catch_union_subsumed] 联合类型 catch 逐候选遮蔽计数
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 规格 §12 联合类型模式（IllegalArgumentException | Exception 的每个候选均可被前一 catch(Exception) 捕获 → 逐候选各报 1 条; 1.3.0-alpha 探针 L8C17/L8C44 双锚实测; scan-2 敏感——实现若改为合并为 1 条即红）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "sema_useless_exception_type"

main() {
    try {
        throw Exception("x")
    } catch (e: Exception) {
        println("first")
    } catch (e: IllegalArgumentException | Exception) {
        println("second")
    }
}
