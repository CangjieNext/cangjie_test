// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pkg -o pkg.%middle
// EXEC-PIPE-0: %compiler %cmp_opt  %n.cj pkg.%middle

internal import pkg.*

class C {
    var a: Rune = 'a'
}

var b: C = C()

main() {
    println(b.a)
}
