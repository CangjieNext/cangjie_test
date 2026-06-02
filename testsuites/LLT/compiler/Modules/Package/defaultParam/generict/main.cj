// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg/pkg.%middle
// EXEC: %compiler %cmp_opt pkg/pkg.%middle %n.cj --import-path pkg -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkg.*

main(): Int64 {
    var a: Int32 = foo<Int32>(a: Option<Int32>.None)
    var b: Int32 = foo<Int32>(a: Option<Int32>.Some(1), b: 3)
    var c: Int32 = foo<Int32>()
    if ((a + b + c) == Int32(5)) {
        return 0
    }
    return 1
}
