/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
class Base1 {
    public var num1: Int64 = 1
    public var num2: Int64 = 2
    public var num3: Int64 = 3
}

class Base2 {}

class Data1 {
    public var d0: Int32 = 1
    public var d1: Int64 = 2
    public static var numberData: Int16 = 3
    public static var obj1: Base1 = Base1()
    public static var obj2: Base2 = Base2()
    public func foo() {}
}

class Data2 {
    public static var numberData: Int16 = 3
    public static var obj1: Base1 = Base1()
    public static var obj2: Base2 = Base2()
    public func foo() {}
}

func run(): Int64 {
    var value: Data1 = Data1();
    if (value.d0 == 1 && Data1.numberData == 3) {
        return 0
    }
    return 1
}

var globalObj: Data1 = Data1()
var globalInt: Int32 = 32;

main(): Int64 {
    return run()
}
