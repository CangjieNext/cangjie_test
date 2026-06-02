// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgA
internal import std.unittest.*//testfame
import std.unittest.testmacro.*//macro_Defintion

func get(): Int64{
    return 13;
}

external class MyDemo{

}

@Test
external class MyTestClass{
    public func getValue(): Int64 {
        println("getValue")
        256
    }

    public override func beforeAll():Unit {
        println("beforeAll")
    }

    @TestCase
    @Skip
    public func myCase1():Unit{
        println("This is case no.1")
    }

    @TestCase
    public func myCase2():Unit{
        print("This is case no.2")
        let s =Array<Int64>([])
        print("End of case no.2")
    }

   @TestCase
    public func myCase3():Unit{
        @Expect(get(), 11)
        @Expect(Array<Int64>([1,2,3]), Array<Int64>([1,2]))
        println("End of case no.3")
    }


    @Bench[10]
    @TestCase
    public func myCase4(){
        var s: String = "hello cangjie"
        for(i in 1..1000) {
            s =s.concat(i.toString())
        }
    }
}

@Test
func myFunc() {
    var s: String = "hello cangjie"
    for(i in 1..10000) {
        s =s.concat(i.toString())
    }
}
