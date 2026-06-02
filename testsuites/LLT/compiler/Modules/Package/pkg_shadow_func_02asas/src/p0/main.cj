// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o b.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b.%middle %diag_json %f -o %output 2>&1 | compare %f

package p0

internal import p1.foo as goo
internal import p2.foo as goo

main(): Int64 {
    var a1 = goo(Int8(1))
    var a2 = goo(Int16(1))
    var a3 = goo(Int32(1))
    var a4 = goo(Int64(1))
    return 0
}
// ASSERT: scan sema_ambiguous_match
