// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A nested composition ('a ~> b ~> 1') fails on the outer '~>'. Recovery must
// restore the original inner operands: the inner BinaryExpr is still owned by
// the outer node and must not be left as an already-consumed desugar result.

// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_invalid_binary_expr
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func a(x: Int64): Int64 {
    x
}

func b(x: Int64): Int64 {
    x
}

main() {
    let h = a ~> b ~> 1
}
