// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [N13_sealed_outside] 包外 sealed 不可见子类 wildcard 保留
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.6 N13（定义包内不可见子类仍属可能取值 → wildcard 保留 0 warning; 依赖 HiddenSquare 同包私有可见性; 2026-09-20 升 A: 同包单文件形态本 SDK 实测 0 unreachable/useless; 完整跨包形态由 X6_sealed_multi_file 承载）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

// 本用例以依赖形态承载: package library 定义 sealed interface + 不可见子类;
// package application 的 wildcard 保留。单文件内以同包形态近似（本地 SDK 0 warning;
// 完整工具链需 DEPENDENCE 多文件形态, 见 testcases/spec_driven_multi/ N13 目录）。
sealed interface Shape {}
public class Circle <: Shape {}
class HiddenSquare <: Shape {}

func classify(s: Shape): Int64 {
    match (s) {
        case _: Circle => 0
        case _ => 1
    }
}

main() {
    println(classify(Circle()))
}
