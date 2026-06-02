/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1<T>{
    func test1(a:T):T
    func test2():Unit
}

enum E1<U> <:I1<Int64>{
    XY(U)
    public func test1(a:Int64):Int64{
        return a
    }
    public func test2():Unit{}
}

main() {
    var a = E1<Int64>.XY(5)
    var b = a.test1(2)
    var c = a.test2()
    0
}
