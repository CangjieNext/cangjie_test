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
    public var i: T
    public func setNum(x: T): Unit {
        i = x
    }
    public init(x: T) {
        i = x
    }
}

main(): Int64 {
    var data = Data<Int32>(123)
    var myTuple = (data, 1)
    data.setNum(4)
    print(data.i.toString())
    if (myTuple[0].i == 4) {
        return 0
    }
    return 1
}
