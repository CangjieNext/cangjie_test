/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_03_04_01_04_a01

  @Level:         1
  @Assertion:    3.4.1.4(1) The protected access modifier protected is an access
                 level between default and public. The members declared as protected
                 can be accessed not only inside the package, but also outside the
                 package for the current class subclasses.

  @Description:  Auxilary file for tests for `protected` modifier

  @Structure:    complex-aux
*/

package pkg1

public enum E {
    C | D | F | G
}

public open class A {
    protected var i: Int32 = 0
    protected var s: String = "bla-bla-str"
    protected var f: Float64 = .666

    protected prop p: Bool {
        get() {
            true
        }
    }

    protected func funcE(): E {
        E.F
    }
}

let a: A = A()
var i1 = a.i
var s1 = a.s
var p1 = a.p
var e1 = a.funcE()
