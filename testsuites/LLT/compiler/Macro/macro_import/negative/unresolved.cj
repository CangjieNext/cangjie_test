// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f --import-path . -o %output
// ASSERT: scan cannot resolve macro import target package 'no_such_pkg'

// DEPENDENCE: unresolved_m.cj

// E2E for 'macro_import_pkg_unresolved': expanding a macro whose package
// declares `macro import no_such_pkg` fails with the dedicated diagnostic
// once the injected import cannot be resolved (the cjo of the target is not
// in the search path).

import m.*

@Dummy
func f(): Int64 {
    return 42
}

main() {
    println(f())
}
