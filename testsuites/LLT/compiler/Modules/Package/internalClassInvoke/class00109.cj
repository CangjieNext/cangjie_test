// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkgs
// EXEC: %compiler %compile_lib_opt -p pkgs -o pkgs.%middle
// EXEC: %compiler pkgs.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkgs.*

main(): Int64 {
    var data = Data()
    var a = Data.a.a
    var b = data.b.b
    let b2 = Data().b.b
    let c = Data().c
    let d = data.d
    return 0
}
