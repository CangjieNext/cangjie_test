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

public struct Aoo {
    public var value = TimeUnit1.Year
    public init() {}
}

var a = Aoo().value

main(): Int64 {
    let Num: Int64 = match (a) {
        case Year => 0
        case Month => 1
        case Day => 1
        case Hour => 1
    }
    return Num
}
