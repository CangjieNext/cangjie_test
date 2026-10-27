// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pc.cj mb.cj ma.cj
// EXEC: %compiler --output-type=staticlib pc.cj
// EXEC: %compiler %cmp_macro mb.cj --import-path .
// EXEC: %compiler %cmp_macro ma.cj --import-path .
// EXEC: %run_macro %compiler %cmp_opt %f --import-path . -L . --link-options "-l:libpc.a" -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan 3

// E2E for 'macro import' promotion chain: ma -> mb -> pc. The downstream only
// imports ma, pc.cval shall become visible through the transitive promotion.

import ma.*

@DummyA
func f(): Int64 {
    return cval()
}

main() {
    println(f())
}
