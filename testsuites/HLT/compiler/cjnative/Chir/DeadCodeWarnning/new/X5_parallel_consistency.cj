// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [X5_parallel_consistency] 同文件多 root 串行/并行诊断一致
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: dt-design 和其他特性交互用例2（多 source roots 的串行/并行路径 warning 数量、顺序、范围一致——本用例固定计数供两配置对照）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-3 "DiagKind": "chir_dce_unreachable_expression_hint"
// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_block_in_expression"

func a(): Int64 {
    return 1
    println("a")
    0
}

func b(): Int64 {
    throw Exception()
    println("b")
    0
}

func c(): Int64 {
    if (false) {
        println("c-block")
    }
    return 2
    println("c")
    0
}

main() {
    println(a())
    println(b())
    println(c())
}
