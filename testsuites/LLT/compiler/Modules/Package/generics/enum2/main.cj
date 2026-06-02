// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %frontendCompiler %typecheck %cmp_opt pkg/pkg.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg/pkg.%middle
// EXEC: %compiler %cmp_opt pkg/pkg.%middle %n.cj --import-path pkg
// EXEC: %compiler %cmp_opt pkg/pkg.%middle %n.cj --import-path pkg -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

internal import pkg.opt

func run(): Int64 {
    var res: Int32 = match (opt) {
        case Some(x) => x
        case None => 0
    }
    if (res == 1) {
        return 0
    }
    return 1
}

main(): Int64 {
    run()
}
