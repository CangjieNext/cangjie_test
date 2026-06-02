// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*

main() {
    let fnstr = """
    func fn(@A[1]a: collection.ArrayList<String>){

    }
"""
    let tokens = cangjieLex(fnstr)
    let decl = (parseDecl(tokens) as FuncDecl).getOrThrow()
    decl.dump()
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
