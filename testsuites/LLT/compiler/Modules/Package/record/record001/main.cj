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

main() {
    var n: Rectangle = Rectangle(10, 20, {a: Int32 => return a + 1})
    n.width = 15
    let a = n.width;
    let call = n.f(99)
    let res = a + n.length + call + n.count()
    if (res == 155) {
        return 0
    }
    return 1
}
