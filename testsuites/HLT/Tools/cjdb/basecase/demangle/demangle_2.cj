/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_re

public class ClassViaExtend {
    public var width: Int32 = 10
    public var length: Int32 = 20
    public init (par_1: Int32, par_2: Int32) {
      this.width = par_1
      this.length = par_2
    }

}

extend ClassViaExtend{
    public static prop v1: Int64 { //静态成员属性
        get() { 1 }
    }
    public prop v2: Int64 { //实例成员属性
        get() { 2 }
    }
}


var arrayTopInt64 : Array<Int64> =[12, 23, 34]

public open class ClassViaOverLoad{
    public var width: Int32 = 10
    public var length: Int32 = 20

    public init(){}
    public init (par_1: Int32, par_2: Int32) {
        this.width = par_1
        this.length = par_2
    }
}



public class test_C4<X,Y> {

    public test_C4(
        x: Int64, // primary constructor, it's name is the same as the struct
        y: X,
        v!: Int64 = 1, // regular parameter
        private var z!: Y // member variable parameter
    ){
        print("I am in main init method.\n")
    }
}

func test_input_2(b:Int64){
    return b
}

main(args: Array<String>){
    let class_004 = test_C4<Bool,String>(1, true, v:2, z:"你好，cangjie。")
    let claIns_2:ClassViaOverLoad = ClassViaOverLoad(12,32)
    let claIns_1:ClassViaExtend = ClassViaExtend(12,32)
    var varCE3 = claIns_1.v2 //实例成员属性 (Int64) :2

    for (arg in args) {
        println(arg)
    }
    func test_input(a:Array<String>){
        var b = a
        for (i in b){
            println(i)
        }
        func test_input_3(b:Int64)
        {
            return b
        }
        test_input_3(10)
    }

    test_input(args)
    test_input_2(10)
    return 0

}
