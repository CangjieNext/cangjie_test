// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        \@OverflowWrapping
        func testWrapping(x: UInt64, y: UInt64) {
            return x * y
        }
    )
    let funcDecl = (parseDecl(input) as FuncDecl).getOrThrow()
    let output = quote($funcDecl)
    let annotations = funcDecl.annotations
    if (annotations.size != 1) {
        return 1
    }
    let anno = annotations[0]

    let ident = anno.identifier
    if (ident.value != "OverflowWrapping") {
        return 3
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
