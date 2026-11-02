// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pa.cj m.cj
// EXEC: %compiler --output-type=staticlib pa.cj
// EXEC: %compiler %cmp_macro m.cj --import-path .
// EXEC: %run_macro %compiler %cmp_opt %f --import-path . -L . --link-options "-l:libpa.a" -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan 15

// E2E for the ALL form 'macro import pa.*': the downstream package only
// imports m and can use ALL public symbols of pa (aval + bval = 15) after
// macro expansion.

import m.*

@Dummy
func f(): Int64 {
    return aval() + bval()
}

main() {
    println(f())
}
