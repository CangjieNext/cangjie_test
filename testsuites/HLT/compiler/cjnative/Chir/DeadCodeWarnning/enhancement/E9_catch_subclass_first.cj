// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E9_catch_subclass_first] 子类 catch 在前父类 catch 在后不构成遮蔽
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 规格 §12 反例（父类 Exception 可捕获子类 IllegalArgumentException 实例但反之不成立——前块不能捕获后块的全部可捕获类型 → 双 catch 均可达 0 warning; 1.3.0-alpha 探针实测）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

main() {
    try {
        throw Exception("x")
    } catch (e: IllegalArgumentException) {
        println("sub")
    } catch (e: Exception) {
        println("super")
    }
}
