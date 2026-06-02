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

struct Data {
    public Data(let x!: Int32 = 1, let y!: Int32 = 2) {}
}

interface I<T> {
    func getData(data: T): T
}

class Foo <: I<Data> {
    public func getData(data: Data): Data {
        Data(x: data.x + 1, y: data.y + 1)
    }
}

func run(): Int64 {
    var res: Int32
    let data1: Data = Data()
    var data2: Data = Foo().getData(data1)
    var res1: Int32 = data2.x
    var res2: Int32 = data2.y
    if (res1 == 2 && res2 == 3) {
        return 0
    }
    return 1
}
