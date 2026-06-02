// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = """
        @OverflowWrapping
        public func Foo() {
            A.Foo()
            var c = C()
            c.f1().f2().f3()
            return ()
        }
    """
    let funcTokens = cangjieLex(code)
    funcTokens.dump()
    let funcDecl = parseDecl(funcTokens)
    let modifiers = funcDecl.modifiers
    if (modifiers.size != 1) {
        return 1
    }
    println(funcDecl.annotations[0].identifier.value)
    if (modifiers[0].keyword.value != "public") {
        return 1
    }
    let tokens = quote($funcDecl)
    tokens.dump()
    let flag = compareTokens(funcTokens, tokens)
    if (!flag) {
        return 1
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
