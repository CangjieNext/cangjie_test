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

struct Test {
    public let a: Range<Int32>
    public let range1: Range<Int32> = 0..5 : 1
    public init(x: Range<Int32>) {
        a = x
    }
}

let param: Range<Int32> = 0..10 : 1
let range1 = Test(param).range1

func run(): Int64 {
    var res: Int32 = 0
    for (i in range1) {
        res = res + i
    }
    if (res == 10) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
