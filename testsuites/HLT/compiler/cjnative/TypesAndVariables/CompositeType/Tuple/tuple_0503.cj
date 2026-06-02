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

class Data<T> {
    public var i: (T, Int32)
    public init(x: (T, Int32)) {
        this.i = x
    }
    public func getMem1(): Int32 {
        return this.i[1]
    }
}

main(): Int64 {
    var data = Data<Int64>((2, 3))
    var res = data.getMem1()
    if (res == 3) {
        return 0
    }
    return 1
}
