/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C1{
    func test1<T>() {
        let x = -1
        var a = match {
            case x > 0 => 0
            case x < 0 => 1
            case _ => 2
        }
    }
}

struct S1<T>{
    func test1<T>() {
        let x = -1
        var a = match {
            case x == 0 => print("x > 0")
            case _ => print("x = 0")
        }
    }
}

main() {
    var a = C1()
    var b = a.test1<Int64>()
    var c = S1<Int64>()
    var d = c.test1<Int64>()
    0
}
