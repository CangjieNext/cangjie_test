// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E7_catch_wildcard] wildcard catch 与类型 catch 互相遮蔽
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 规格 §12 catchPattern 两种模式（wildcard ≡ e: Exception——两个方向均构成完全遮蔽; 1.3.0-alpha 探针各 1 条共 2 条, 前者锚于 catch (_) 的 wildcard 列, 后者锚于类型模式列）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "sema_useless_exception_type"

func typeAfterType() {
    try {
        throw Exception("x")
    } catch (e: Exception) {
        println("a")
    } catch (_) {
        println("b")
    }
}

func typeAfterWildcard() {
    try {
        throw Exception("x")
    } catch (_) {
        println("a")
    } catch (e: Exception) {
        println("b")
    }
}

main() {
    typeAfterType()
    typeAfterWildcard()
}
