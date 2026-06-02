// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: aaa bbb temp
// EXEC: %compiler %pkg_opt aaa/ccc %compile_lib_opt --output-dir temp/aaa -o liba_c.a
// EXEC: %compiler %pkg_opt bbb/ccc %compile_lib_opt --output-dir temp/bbb -o libb_c.a
// EXEC: %compiler %f --import-path temp -L temp/aaa -L temp/bbb -la_c -lb_c -o %output
// EXEC: %run_opt %output

internal import aaa.*
internal import bbb.*

main() {
    var m = ac
    var n = bc
    return m - n
}
