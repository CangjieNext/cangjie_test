/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Test<T> {
    let start: Int64
    let len: Int64
    public init(size: Int64, repeat!: T) {
        this.start = 0
        this.len = size
    }
    public init(size: Int64, initElement: (Float64) -> T) {
        this.start = 0
        this.len = size
        initElement(1.1)
    }
    func name(x1: Int64, y1: (Bool) -> T) {
        var a: Int64 = x1
        var b: Int64 = 6
        y1(true)
        return a + b
    }
    func name(x1: Bool, y1: Int64) {}
    func name(x1: Bool, y1: Int32, z1!: Float64) {}
}

main(): Int64 {
    var x1 = Test<Float64>(
        8,
        {
            i => i*2.2
        }
    )
    var x4 = x1.name(1,
    {
         aa => 1.2
    }
    )
    var x5 = x1.name(true, 8)
    var x6 = x1.name(true, 8, z1: 6.6)
    return 0
}
