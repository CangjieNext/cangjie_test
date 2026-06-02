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

main(): Int64 {
    return run()
}

struct Data1 {
    public var x: Int32 = 1
    public var y: Int32 = 2
    public init(x!: Int32 = 1, y!: Int32 = 2) {
        this.x = x
        this.y = y
    }
}

struct Data2<T> {
    public var data: T
    public Data2(data1: T) {
        data = data1
    }
}

func run(): Int64 {
    var res: Int32
    let data1: Data1 = Data1()
    var data2: Data2<Data1> = Data2<Data1>(data1)
    var getData: Data1 = data2.data
    var res1: Int32 = getData.x
    var res2: Int32 = getData.y
    if (res1 == 1 && res2 == 2) {
        return 0
    }
    return 1
}
