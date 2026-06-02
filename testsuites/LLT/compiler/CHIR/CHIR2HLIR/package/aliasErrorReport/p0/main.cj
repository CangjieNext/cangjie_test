// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o b.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b.%middle %f %diag_json -o %output 2>&1 | compare %f

package p0

internal import p1.foo as goo
internal import p2.foo as goo

main(): Int64 {
    var a = goo
    return 0
}
// ASSERT: scan package_conflict_import
// ASSERT: scan sema_ambiguous_use
