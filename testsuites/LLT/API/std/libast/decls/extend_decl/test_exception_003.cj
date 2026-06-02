// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.ast.*
import std.collection.*

main() {
    var count = 0
    let decl = ExtendDecl()
    try {
        decl.identifier
    } catch (e: ASTException) {
        count += 1
    }

    try {
        decl.identifier = Token()
    } catch (e: ASTException) {
        count += 1
    }

    if (count == 2) {
        return 0
    }
    return 1
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
