// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

import std.ast.*

main() {
    var input: Tokens = quote(public func foo<T>(@!Anno["仓颉"] a: Int64) {
    a
})
    let decl = parseDecl(input)
    if (let Some(_decl) <- (decl as FuncDecl)) {
        _decl.funcParams[0].dump()
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
