// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p.cj m.cj
// EXEC: %compiler --output-type=staticlib p.cj
// EXEC: %compiler %cmp_macro m.cj --import-path .
// EXEC: %run_macro %compiler %cmp_opt %f --import-path . -L . --link-options "-l:libp.a" -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan 42

// E2E for 'macro import': a macro package m declares 'macro import p', the
// downstream package only imports m and can use p.hello() without importing p.

import m.*

@Dummy
func greet(): Int64 {
    return hello()
}

main() {
    println(greet())
}
