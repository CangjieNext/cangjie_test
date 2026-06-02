/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package packageTest

public enum TimeUnit1 {
    Year | Month | Day | Hour
}

public class A {
    public let value = TimeUnit1.Year
}

public func foo(data: A): TimeUnit1 {
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
