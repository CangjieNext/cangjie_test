/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

private func test() {
    return BB().sum1(1, -1)
}

public class BB {
    public var sum1: (Int64, Int64) -> Int64 = {a, b => a + b}
}

main() {
    var a = test()
    return 0
}
