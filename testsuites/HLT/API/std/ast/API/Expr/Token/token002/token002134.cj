/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows and not OHOS) ASSERT: regex description: newline, token_id: [0-9]*, token_literal_value: \\n, fileID: 1, line: 20, column: 14
// (not Windows and not MAC or OHOS) ASSERT: regex description: newline, token_id: [0-9]*, token_literal_value: \\n, fileID: 1, line: 42, column: 14
// (MAC and not OHOS)ASSERT: regex description: newline, token_id: [0-9]*, token_literal_value: \\n, fileID: 1, line: 64, column: 14

import std.ast.*

@When[os == "Windows"]
func foo(): Int32 {
    var tk = Token(TokenKind.NL)
    tk.dump()
    if (tk.kind != TokenKind.NL) {
        return 1
    }
    if (tk.value != "\r\n") {
        return 2
    }
    if (tk.pos.fileID != 1) {
        return 3
    }
    if (tk.pos.line != 20) {
        return 4
    }
    if (tk.pos.column != 14) {
        return 5
    }
    return 0
}

@When[os == "Linux"]
func foo(): Int32 {
    var tk = Token(TokenKind.NL)
    tk.dump()
    if (tk.kind != TokenKind.NL) {
        return 1
    }
    if (tk.value != "\n") {
        return 2
    }
    if (tk.pos.fileID != 1) {
        return 3
    }
    if (tk.pos.line != 42) {
        return 4
    }
    if (tk.pos.column != 14) {
        return 5
    }
    return 0
}

@When[os == "macOS"]
func foo(): Int32 {
    var tk = Token(TokenKind.NL)
    tk.dump()
    if (tk.kind != TokenKind.NL) {
        return 1
    }
    if (tk.value != "\n") {
        return 2
    }
    if (tk.pos.fileID != 1) {
        return 3
    }
    if (tk.pos.line != 64) {
        return 4
    }
    if (tk.pos.column != 14) {
        return 5
    }
    return 0
}

main() {
    foo()
}

