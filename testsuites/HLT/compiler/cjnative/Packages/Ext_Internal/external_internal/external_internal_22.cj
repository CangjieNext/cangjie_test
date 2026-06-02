/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

package packageTest

public class A<T> where T <: B {
    let a = T.b2
}

struct B {
    public static var b2 = 2
}

main(): Int64 {
    return A<B>().a - 2
}
// ASSERT: scan sema_accessibility
