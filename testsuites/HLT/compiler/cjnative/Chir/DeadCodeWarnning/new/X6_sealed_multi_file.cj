// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [X6_sealed_multi_file] sealed 定义包内穷举（多文件 DEPENDENCE 形态）
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: dt-design 功能点D/接口3（同包 sealed interface 穷尽 → wildcard 1 条; 2026-09-20 新 SDK 实测 1 条 sema_unreachable_pattern 与 M7 同为 sema 层, 升 A; 跨包 0-warning 形态见 N13）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

// 多文件形态承载于 testcases/spec_driven_multi/M7_sealed/ 目录（pkga.cj + main.cj）,
// 本单文件版本以同包 private 子类闭合条件近似。
sealed interface Op {}
class Only <: Op {}

func classify(o: Op): Int64 {
    match (o) {
        case _: Only => 0
        case _ => 1
    }
}

main() {
    println(classify(Only()))
}
