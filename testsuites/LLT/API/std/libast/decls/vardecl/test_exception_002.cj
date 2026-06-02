// EXEC: %compiler %coverage_opt %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output > %n.txt

internal import std.ast.*

main(): Int64 {
    let tmp = quote(
        public func f() {
            println("OK")
        }
    )
    try {
        VarDecl(tmp)
    } catch (e: ASTException) {
        if (e.message == "Cannot construct the 'VarDecl' node.") {
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
