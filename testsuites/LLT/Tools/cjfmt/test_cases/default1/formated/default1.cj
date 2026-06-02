// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import module_name.package1.*
internal import module_name.{package1.*, package2.*}
internal import module_name.package1.a1
internal import module_name.{package1.a1, package2.a2}
internal import std.a.b.{d as e, f as g}
internal import std.a.b as c

main(): Int64 {
    var a = package1.a1
    var b = package2.a2
    var c = a1
    var d = a2
    return 0
}
