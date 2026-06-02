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

type int = Int32

struct Data {
    public let a: int
    public init(x: Int32, y: String) {
        a = x
    }
    public func getA(x: int): int {
        return a + x
    }
}

main(): Int64 {
    var data: Data = Data(2, "hi")
    var res: int = data.getA(3)
    if (res == 5) {
        return 0
    }
    return 1
}
