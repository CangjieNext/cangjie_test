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

main(): Int64 {
    return run()
}

struct Roo<T> {
    public var r: T
    public init(x: T) {
        r = x
    }
}

class Data<T> {
    public let count: T
    public init(x: T) {
        count = x
    }
    public func getFoo<V>(x: Roo<V>, y: V): Roo<V> {
        return Roo<V>(y)
    }
}

func run(): Int64 {
    var a: Int32 = 3
    let roo: Roo<Int32> = Roo<Int32>(a)
    var data: Data<Int32> = Data<Int32>(a)
    var foo: Roo<Roo<Int32>> = data.getFoo<Roo<Int32>>(Roo<Roo<Int32>>(roo), roo)
    var res: Int32 = foo.r.r
    if (res == 3) {
        return 0
    }
    return 1
}
