// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkgs_import_invoke_b.cj
// EXEC: %compiler %cmp_opt %f pkgs_import_invoke_b.cj -o %output
// EXEC: %run %run_opt %output %run_args

package pkgs_import_invoke

func run(): Int64 {
    if (test != 1) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
