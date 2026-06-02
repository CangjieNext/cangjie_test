// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: mod pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt mod/pkg/a.cj --module-name mod -o mod/pkg.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/a.cj -o pkg.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt %n.cj pkg.%middle mod/pkg.%middle  -o %output
// (not CJNATIVE) EXEC: %compiler %cmp_opt %n.cj mod/pkg.%middle pkg.%middle  -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkg.*

main() {
    if (c == 1) {
        return 0
    }
    return 1
}
