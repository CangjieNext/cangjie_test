// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [M7_sealed_exhaustive] 封闭层级 sealed 穷尽
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.4 M7（6 封闭类穷尽 → wildcard 1 条; 2026-09-20 新 SDK 实测 1 条 sema_unreachable_pattern——与官方 exhaustive-wildcard 族(Sema/PatternMatching/UnreachablePattern/*) 同为 sema 层, 升 A; 旧 0911 实测 0 为漏报）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

sealed abstract class Result {}
class Success <: Result {}
class Failure <: Result {}

func classify(value: Result): Int64 {
    match (value) {
        case _: Success => 0
        case _: Failure => 1
        case _ => 2
    }
}

main() {
    println(classify(Success()))
}
