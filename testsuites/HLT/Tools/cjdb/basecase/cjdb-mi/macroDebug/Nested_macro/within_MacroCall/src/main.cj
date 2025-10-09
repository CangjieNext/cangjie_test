/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



import pkg1.*
import pkg2.*

@Foo
struct Data {
    let a = 2
    let b = @AddToMul(2+3)
    @Bar
    public func getA(): Int64 {
        return a
    }
    public func getB(): Int64 {
        return b
    }
}
main(): Int64 {
    let data = Data()
    var a = data.getA() // a = 2
    var b = data.getB() // b = 6
    println("a: ${a}, b: ${b}")
    return 0
}
