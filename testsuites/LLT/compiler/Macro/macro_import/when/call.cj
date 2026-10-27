// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pl.cj pw.cj m.cj
// EXEC: %compiler --output-type=staticlib pl.cj
// EXEC: %compiler --output-type=staticlib pw.cj
// EXEC: %compiler %cmp_macro m.cj --import-path .
// EXEC: %run_macro %compiler %cmp_opt %f --import-path . -L . --link-options "-l:libpl.a" -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan 1

// E2E for 'macro import' block form with per-item @When condition: on a linux
// target only 'import pl' takes effect, the @When[os == "Windows"] item is skipped.

import m.*

@Dummy
func f(): Int64 {
    return lval()
}

main() {
    println(f())
}
