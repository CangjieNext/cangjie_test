/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
 
import std.ast.FuncParam

main() {
    let funcParam0 = FuncParam(quote(@Anno private let a2: CPointer<Int64>))
    funcParam0.toTokens() |> println
    let funcParam1 = FuncParam(quote(@!Anno private let a2: CPointer<Int64>))
    funcParam1.toTokens() |> println
}

/* SCAN-IN
@Anno
private let a2: CPointer < Int64 >
@!Anno
private let a2: CPointer < Int64 >
*/