
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

main() {
    let input = quote(class A{
        public A(){

        }
    })
    let b = (parseDecl(input) as ClassDecl).getOrThrow()
    let ele = b.body.decls[0].toTokens()
    for (e in ele) {
        if (e.value == "public") {
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
