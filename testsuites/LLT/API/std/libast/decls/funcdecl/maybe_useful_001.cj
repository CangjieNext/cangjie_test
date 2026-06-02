// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    let code = """
    class Future2 {
        public init() {
            this.done = false
        }
        private var done: Bool
        public mut prop req: Bool {
        get() {
            this.done
        }
        set(v) {
            this.done = v
        }
        }
    }
    """
    let codeTokens = cangjieLex(code)
    let classDecl = (parseDecl(codeTokens) as ClassDecl).getOrThrow()
    let funcDecl1 = match (classDecl.body.decls[0] as FuncDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    println(funcDecl1.keyword.value)
    if (funcDecl1.keyword.value != "init") {
        return 1
    }

    var funcDecl2 = match (classDecl.body.decls[2] as PropDecl) {
        case Some(v) => v
        case None => throw Exception()
    }

    if (funcDecl2.getter.keyword.kind != TokenKind.ILLEGAL) {
        return 2
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
