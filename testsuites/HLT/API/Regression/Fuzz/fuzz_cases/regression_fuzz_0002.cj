/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %overflow_wrapping %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.ast.*

main() {
    let input = quote(
    class Integer{
        Integer(){}
    }
)
    let classDecl = (parseDecl(input) as ClassDecl).getOrThrow()
    for (n in classDecl.body.decls) {
        parseDecl(n.toTokens(), astKind: "PrimaryCtorDecl")
    }
    0
}
