// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgb/b.cj -o b.%middle
// EXEC: %compiler %cmp_opt a.%middle b.%middle main.cj -o %output
// EXEC: %run %run_opt %output %run_args

internal import a.*
internal import b.*

main() {
    0
}
