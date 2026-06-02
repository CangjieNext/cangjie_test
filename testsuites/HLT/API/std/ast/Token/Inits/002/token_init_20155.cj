/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan description: newline

import std.ast.*

@When[os == "Windows"]
func foo() {
    var a = Token(NL, "\r\n")
    a.dump()
}

@When[os == "Linux"]
func foo() {
    var a = Token(NL, "\n")
    a.dump()
}

@When[os == "macOS"]
func foo() {
    var a = Token(NL, "\n")
    a.dump()
}

@When[os == "iOS"]
func foo() {
    var a = Token(NL, "\n")
    a.dump()
}

main() {
    foo()
}
