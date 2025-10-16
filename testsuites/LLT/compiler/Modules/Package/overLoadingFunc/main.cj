// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p1 p2 p3
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt p1 -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt p2 -o p2.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt p3 -o p3.%middle
// EXEC: %compiler %noColor p1.%middle p2.%middle %diag_json p3.%middle %f 2>&1 | compare %f

internal import p1.foo
internal import p2.foo
internal import p3.foo

func foo(a: UInt64) {}

main(): Int64 {
    let a: Int32 = 1
    foo(a)
    return 0
}
// ASSERT: scan package_conflict_import
