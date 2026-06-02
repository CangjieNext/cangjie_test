// EXEC: %compiler %coverage_opt %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output > %n.txt

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    var tmp = quote()
    try {
        FuncParam(tmp)
    } catch (e: ASTException) {
        if (e.message == "Cannot construct the 'FuncParam' node.") {
            cnt++
        }
    }
    tmp = quote(
        let a
    )
    try {
        FuncParam(tmp)
    } catch (e: ASTException) {
        if (e.message == "Cannot construct the 'FuncParam' node.") {
            cnt++
        }
    }
    tmp = quote(

    )
    try {
        FuncParam(tmp)
    } catch (e: ASTException) {
        if (e.message == "Cannot construct the 'FuncParam' node.") {
            cnt++
        }
    }

    tmp = quote(
        a: Int64
    )
    try {
        let funcParam = FuncParam(tmp)
        funcParam.expr
    } catch (e: ASTException) {
        if (e.message == "The expression of FuncParam is None") {
            cnt++
        }
    }

    tmp = quote(
        static public let a: String
    )
    try {
        let funcParam = FuncParam(tmp)
    } catch (e: ASTException) {
        if (e.message == "Cannot construct the 'FuncParam' node.") {
            cnt++
        }
    }

    if (cnt != 5) {
        return -1
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
