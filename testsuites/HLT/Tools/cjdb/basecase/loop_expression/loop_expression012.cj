/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


struct S1{}

extend S1{
    func test1() {
        var sum = 0
        var hundred: Int64 = 0
        var hundredo = 0
        do {
            for (j in [1,2,3]) {
                while (hundred < 2) {
                    hundred++
                }
                sum += j
            }
            hundredo++
        } while (hundredo < 2)
        println(sum)
    }
}

main() {
    var a1 = S1()
    var a2 = a1.test1()
    0
}
