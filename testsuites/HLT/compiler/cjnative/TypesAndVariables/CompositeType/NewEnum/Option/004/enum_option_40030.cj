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

let x = [0]

class A {
    public var a = {i: Int64 => x}
}

func test(i: Int64) {
    let x = A()
    let c1: ?A = Some(x)
    let r1: ?(Int64) -> Array<Int64> = c1?.a
    let r2: ?Array<Int64> = r1?(i)
    let r3: ?Int64 = r2?[0]
    return r3 ?? 1
}

main(): Int64 {
    return test(1)
}
