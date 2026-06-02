/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args --no-color  2>&1 | compare %f

import std.ast.*

main() {
    let tok = quote(
enum EE {
    | A1(Int64) | B1(Int8)| C1 | ...

    const static func parse(val: Int64): EE {
        match(val) {
            case 1 => A1(1)
            case 2 => B1(1)
            case 3 => C1 
            case _ => C1
        }
    }
}
    )

    let decl = (parseDecl(tok) as EnumDecl).getOrThrow()
    decl.ellipsis.dump()
}
// ASSERT: regex description: ellipsis, token_id: [0-9]+, token_literal_value: ..., fileID: 1, line: 18, column: 34

