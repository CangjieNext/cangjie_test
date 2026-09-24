/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A {


    let x: Int64 = 1


    let y: Int64 = 2



    public func f(): Int64 {

        return x + y

    }


}

enum E {

    | A1

    | B1

}

func g(): Int64 {



    return 1


}

func h(): Int64 {


    return 2
}

main() {


    let a = A()

    println(a.f())

    println(g())
    println(h())


}
