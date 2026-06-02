



struct Test {
    public var a: Int32 = 1

    public var b: Int32 = 2

    public init(a: Int32, b: Int32) {
        this.a = a


        println("this is a test")

        this.b = b


    }

    public init() {

        println("this is a test")

        a = 3
        b = 4

    }
}

let res = Test(5, 6)

let res1 = res.a

let res2 = res.b

func run(): Int64 {

    println("this is a test")

    if(res1 == 5 && res2 == 6) {
        return 0
    }
    return 1

}

main(): Int64 {
    return run()
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
