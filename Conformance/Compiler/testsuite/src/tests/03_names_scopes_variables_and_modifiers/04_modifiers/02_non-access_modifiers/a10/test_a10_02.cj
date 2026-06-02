/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a10_02

  @Level:         1

  @Assertion:    3.4.2(10) sealed means that the class or interface can only be inherited or implemented in the current
                 package, See class for details

  @Description:  Check that sealed modifier allows a class to be inherited or an interface to be implemented. Their
                 functions can be accessed from the type that does the inheritance/implementation.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        6084

*/

import utils.assert.Assert

sealed interface I {
    static func getType() : String

    func f() {
        return "member function; " + getType()
    }

    static func g() {
        return "static function; " + getType()
    }
}

sealed abstract class C1 {
    func f1() {
        return "foo"
    }

    protected func f2() {
        return "protected foo"
    }

    static func f3() {
        return "static foo"
    }
}

class C2 <: C1 {

}

class C <: I {
    public static func getType() { "class" }
}

struct S <: I {
    public static func getType() { "struct" }
}

enum E <: I {
    E0

    public static func getType() { "enum" }
}

class G<T> <: I {
    public static func getType() { "generic class" }
}

abstract class A <: I {
    public static func getType() { "abstract class" }
}

class AA <: A { }

main() {
    var obj = C2()
    Assert.equals("foo", obj.f1())
    Assert.equals("protected foo", obj.f2())
    Assert.equals("static foo", C2.f3())

    Assert.equals("member function; class", C().f())
    Assert.equals("member function; struct", S().f())
    Assert.equals("member function; enum", E.E0.f())
    Assert.equals("member function; generic class", G<String>().f())
    Assert.equals("member function; abstract class", AA().f())

    Assert.equals("static function; class", C.g())
    Assert.equals("static function; struct", S.g())
    Assert.equals("static function; enum", E.g())
    Assert.equals("static function; generic class", G<Unit>.g())
    Assert.equals("static function; abstract class", A.g())
}
