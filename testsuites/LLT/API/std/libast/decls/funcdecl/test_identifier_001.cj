// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    var tk = quote(func `public`() {})
    tk.dump()
    var decl = parseDecl(tk)
    decl.toTokens().dump()
    if (decl.toTokens()[1].value == "`public`") {
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
