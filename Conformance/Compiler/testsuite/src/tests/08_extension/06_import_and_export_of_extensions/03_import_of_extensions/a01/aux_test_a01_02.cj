/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:     Defines a package pkg2 for test.

  @Structure:       complex-aux
*/

package pkg2

public class MyClass0 {}

interface myInterface {
    static func myStaticFunc(): String { "myInterface myStaticFunc()" }
}

extend MyClass0 <: myInterface {
    public static func myStaticFunc1(): String { "MyClass0 myStaticFunc1()" }
}

public struct MyStruct0 {}

extend MyStruct0 <: myInterface {
    public static func myStaticFunc1(): String { "MyStruct0 myStaticFunc1()" }
}

public enum MyEnum0 { H }

extend MyEnum0 <: myInterface {
    public static func myStaticFunc1(): String { "MyEnum0 myStaticFunc1()" }
}
