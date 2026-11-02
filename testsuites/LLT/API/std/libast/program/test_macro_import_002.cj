/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan single-first-token macro
// ASSERT: scan single-tokens macroimportp
// ASSERT: scan block-first-token macro
// ASSERT: scan block-tokens macro{importp

// Guard for MacroImportList.toTokens(): the single form must emit the
// 'macro' keyword. Omitting it would round-trip `macro import p` back into
// a plain `import p`, silently dropping the node from Program.macroImports.

import std.ast.*

func tokensToString(tks: Tokens): String {
    var ret = ""
    for (t in tks) {
        ret += t.value
    }
    return ret
}

main() {
    let single = parseProgram(cangjieLex("macro package m\nmacro import p\n")).macroImports[0]
    let singleTks = single.toTokens()
    println("single-first-token ${singleTks[0].value}")
    println("single-tokens ${tokensToString(singleTks)}")

    let block = parseProgram(cangjieLex("macro package m\nmacro {\nimport p\nimport q.*\n}\n")).macroImports[0]
    let blockTks = block.toTokens()
    println("block-first-token ${blockTks[0].value}")
    println("block-tokens ${tokensToString(blockTks)}")
}
