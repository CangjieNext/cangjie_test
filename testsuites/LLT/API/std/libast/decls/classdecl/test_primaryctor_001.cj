
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    let input = quote(
    class Integer{
        Integer(){}
    }
)
    let classDecl = (parseDecl(input) as ClassDecl).getOrThrow()
    for (n in classDecl.body.decls) {
        // n is type of NodeFormat_Decl
        (parseDecl(n.toTokens(), astKind: "PrimaryCtorDecl") as PrimaryCtorDecl).getOrThrow()
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
