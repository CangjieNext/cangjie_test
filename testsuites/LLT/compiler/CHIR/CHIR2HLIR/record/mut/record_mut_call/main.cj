// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg
// EXEC:%compiler %noColor %enableCompileDebug %compile_lib_opt pkg/pkg.cj -o pkg.%middle
// ERRCHECK:%compiler %noColor %enableCompileDebug pkg.%middle %n.cj %diag_json -o %n.%suffix

internal import pkg.*

main(): Int64 {
    var h = happy<Int32>()
    (h - 1).sayHi()
    (h + 1).sayHi()
    (h - 1).sayHi(8)
    (h + 1).sayHi(8)
    return 0
}
// ASSERT: scan sema_immutable_access_mutable_func
