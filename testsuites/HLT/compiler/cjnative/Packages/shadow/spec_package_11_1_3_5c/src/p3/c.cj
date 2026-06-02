/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../p1 ../p2 ../p3
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o p2.%middle
// EXEC-PIPE: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

package p3

public import p1.C
public import p2.C
public import p1.f
public import p2.f

public class C {}

public func f(a: Int64) {}

main(): Int64 {
    return 0
}
// ASSERT: scan package_shadowed_import
