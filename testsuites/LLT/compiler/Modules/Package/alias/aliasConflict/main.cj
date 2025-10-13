// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkgs
// EXEC: %compiler %compile_lib_opt -p pkgs -o pkgs.%middle
// EXEC: %compiler pkgs.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkgs.f1 as f
internal import pkgs.f2 as f

func f(a: Int32) {}

main() {
    f(1)
    0
}
