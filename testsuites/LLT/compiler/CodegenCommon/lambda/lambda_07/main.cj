// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkgA
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgA/pkgA.cj -o pkgA.%middle
// EXEC: %compiler %cmp_opt pkgA.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkgA.*

enum EM {
    CA | CB((EA, Bool, Option<EA>, Option<EM>) -> Unit, SA)
}

main() {
    0 // No need to add any logic here since we're just going to check if the compilation fails.
}
