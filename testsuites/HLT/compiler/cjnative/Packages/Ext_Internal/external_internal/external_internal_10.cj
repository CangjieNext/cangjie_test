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

enum TimeUnit1 {
    Year | Month | Day | Hour
}

public struct A {
    public let value = TimeUnit1.Year
}

func foo(data: A): TimeUnit1 {
    return A().value
}

main(): Int64 {
    let a = foo(A())
    let Boo: Bool = match (a) {
        case Year => true
        case Month => false
        case Day => false
        case Hour => false
    }
    if (Boo) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_accessibility_with_main_hint
