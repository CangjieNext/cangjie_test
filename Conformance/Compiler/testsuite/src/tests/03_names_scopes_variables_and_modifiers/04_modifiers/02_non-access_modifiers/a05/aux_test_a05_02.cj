/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_03_04_02_a05_02

  @Level:         1
  
  @Assertion:    3.4.2(5) static means that the member is a static member, and static members cannot be accessed
                 through instance objects, See class for details

  @Description:  This file defines struct S, interface I and public class C1.

  @Structure:    complex-aux
*/

package aux_test_a05_02

public struct S {
    public static let E = 2.71
}

public interface I {
    static func foo1() {
        return "foo1"
    }
}

public class C1 <: I {
    static public var currentYear = 2023
    static public let PI = 3.14

    static public func foo2() {
        return "foo2"
    }

    static public mut prop b: Int64 {
        get() { 100 }
        set(p) {  }
    }
}

extend C1 {
    public static func foo3() {
        return "foo3"
    }
}