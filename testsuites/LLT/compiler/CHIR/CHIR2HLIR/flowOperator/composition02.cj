// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj %diag_json -o %output 2>&1 | compare %f

func f(x: Int32): Float32 {
    Float32(x)
}

func g(x!: Float32): Float32 {
    x
}

main() {
    var fg = f ~> g
    return 0
}
// ASSERT: scan sema_fail_flow_expr_operand_has_named_param
