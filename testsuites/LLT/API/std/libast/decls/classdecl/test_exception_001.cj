// EXEC: %compiler %coverage_opt %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output > %n.txt

import std.ast.*

main(): Int64 {
    var token = quote(
        public func f() {
            ()
        }
    )
    try {
        ClassDecl(token)
    } catch (e: ASTException) {
        if (e.message == "Cannot construct the 'ClassDecl' node.") {
            return 0
        }
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
