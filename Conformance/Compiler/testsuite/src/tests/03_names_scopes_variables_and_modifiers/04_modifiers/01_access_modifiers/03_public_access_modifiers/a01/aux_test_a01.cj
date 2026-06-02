/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_03_04_01_03_a01

  @Level:         1
  @Assertion:    3.4.1.3(1) The public access modifier public is the most lenient
                 access level. Members declared as public are accessible in all scopes.

  @Description:  Auxilary file for tests for `public` modifier

  @Structure:    complex-aux
*/

package pkg1

public var v1 = 0
public let l1 = 10.1

public open class A {
    public var str = "0"

    public prop a: Bool {
        get() {
            false
        }
    }
}

public class ChildA <: A {
    public func func1(): String {
        return str
    }
}

public struct Struct {
    public let width1: Int32 = 10
}

public enum AAA {
    AAA1 | AAA2 | AAA3
}

public interface I1 {
    func f1(): Int32
}

public func f2(): Int64 {
    return 0
}

public type AliasA = A

extend A {
    public func foo(): Unit {}
}
