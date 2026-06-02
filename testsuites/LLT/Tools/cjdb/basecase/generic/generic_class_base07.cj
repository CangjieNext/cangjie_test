// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func aoo<T>(x: (T) -> T): (T) -> T {
    var a = x
    return a
}

class Data<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

main(): Int64 {
    var b = aoo<Int32>({x: Int32 => Int32(1)}) //expr aoo<Int32>({x: Int32 => Int32(1)})
    var e = aoo({x: Int32 => Int32(1)})
    var a = Data<(Int32) -> Int32>(b) //expr a
    var c = Data<(Int32) -> Int32>(e)
    var d = Data(b) //expr Data(b)
    var f = Data(e)
    return 0
}
