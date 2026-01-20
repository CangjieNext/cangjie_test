/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1 {
    func test1():Unit
}

class C1 <: I1{
    public func test1():Unit {
        var sum = 0
        var hundred: Int64 = 0
        for (j in [1,2,3]) {
            while (hundred < 2) {
                hundred++
            }
            sum += j
        }
        println("gg")
    }
}

main() {
    var a1 = C1()
    var a2 = a1.test1()
    println("ddd")
}
