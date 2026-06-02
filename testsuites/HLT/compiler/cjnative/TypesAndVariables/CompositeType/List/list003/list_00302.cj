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

class C<T> {
    public var a: Array<T>
    public var b: Array<Int64>
    public init(input: T) {
        a = [input]
        b = [1]
    }
}

main(): Int64 {
    var c = C<Int64>(1)
    return c.a.size + c.b.size - 2
}
