// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.ast.*

main(): Int64 {
    let input = quote(
        package a
        internal import std.ast.*
    )

    let fileNode = parseProgram(input)
    let packageSpec = fileNode.packageHeader
    packageSpec.toTokens()
    let imports = fileNode.importLists
    imports[0].toTokens()

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
