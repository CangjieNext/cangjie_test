// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../define.cj
// EXEC: %compiler %cmp_macro ../define.cj
// EXEC: %compiler %cmp_opt %f -Woff unused -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not core dumped
// ASSERT: scan error
import define.*

@DeclLateM
main() {
    hi
    let x: Int64 = @ExprLateM(1.0 + 'hello')
    let y: Float64 = @ExprLateM(1.0 + true)
    let z: String = @ExprLateM('你好' + 1.0)
    return
}
