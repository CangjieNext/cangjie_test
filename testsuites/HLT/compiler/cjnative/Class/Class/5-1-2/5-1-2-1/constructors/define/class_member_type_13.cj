/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Test {
    public var range1: Range<Int64> = 0..5
    public var range2: Range<Int64>
    public init(x: Range<Int64>) {
        range2 = x
    }
    public func f(x: Range<Int64>): Range<Int64> {
        return x
    }
}

func run(): Int64 {
    var res: Int64 = 0
    var arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    var rge2 = 0..5
    var test: Test = Test(rge2)
    var range1 = test.range1
    var range2 = test.range2
    var range3 = test.f(rge2)
    for (i in arr[range1]) {
        res = res + i
    }
    if (range1 == range2 && range2 == range3 && res == 10) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
