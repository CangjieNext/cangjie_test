// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: main.cj macro_define.cj
// EXEC: %compiler %cmp_macro %f macro_define.cj
// EXEC: %compiler main.cj %macro_lib -o %output
// EXEC: %run %run_opt %output %run_args

macro package macro_def_pkg

class A<T> {}

extend<T> A<T> {
    static func foo<T>(a: T) {
        return a
    }
}

func macro_expand_test() {
    return A<Int64>.foo(-1) + A<Int32>.foo<Int64>(1)
}
