// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: aaa bbb
// EXEC: %compiler %pkg_opt aaa/ccc %mod_name_opt aaa %compile_lib_opt -o ./
// EXEC: %move libaaa.a aaa/
// EXEC: %move aaa.* aaa/
// EXEC: %compiler %pkg_opt bbb/ccc %mod_name_opt bbb %compile_lib_opt -o ./
// EXEC: %move libbbb.a bbb/
// EXEC: %move bbb.* bbb/
// EXEC: %compiler %f aaa/libaaa.a bbb/libbbb.a -o %output
// EXEC: %run_opt %output

internal import aaa.*
internal import bbb.*

main() {
    var m = ac
    var n = bc
    return m - n
}
