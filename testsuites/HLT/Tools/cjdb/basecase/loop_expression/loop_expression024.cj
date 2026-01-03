/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E1<T> {
    AB(T)
    func test1(){
        var hundredo = 0
        do {
            hundredo++
        } while (hundredo < 2)
        return hundredo
    }
}


main() {
    var a = E1<Int64>.AB(1)
    a.test1()
    0
}
