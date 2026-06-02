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
    public func test(a: T) {
        a
    }
}

func bar(x: Int64) {
    1
}

main(): Int64 {
    var c = C<Int64>()
    let c1 = Option<C<Int64>>.None
    let r1 = c1?.test
    let res = r1 ?? bar
    return res(0) - 1
}
