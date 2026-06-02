// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    let program = quote(
        public open class Class_1694130295577_97 {
            public static mut prop var_1694130295577_114 : Range<Int16> {

            };
        };
    )

    let fileNode = (parseDecl(program) as ClassDecl).getOrThrow()
    for (i in 0..fileNode.body.decls.size) {
        var a = fileNode.body.decls[i].toTokens()
        if (a[0].kind == TokenKind.NL) {
            return 1
        }
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
