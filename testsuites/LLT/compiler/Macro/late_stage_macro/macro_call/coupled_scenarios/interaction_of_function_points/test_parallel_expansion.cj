// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../define.cj
// EXEC: %compiler %cmp_macro ../define.cj
// EXEC: %compiler %cmp_opt %f -Woff unused -o %output --parallel-macro-expansion
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not core dumped
// ASSERT: scan-not error
import define.*

@DeclLateM
class W {
    @DeclLateM
    public let x = @ExprLateM(1.0)
    @DeclLateM
    public let y = @ExprLateM(1)
}

@DeclLateM
class W0 {
    @DeclLateM
    public let x1 = @ExprLateM(0.0)
    @DeclLateM
    public let y1 = @ExprLateM(0)
}