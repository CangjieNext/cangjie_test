/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a04_03

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(4)
              The return type of the function must be the same as
              or a subtype of the return type of the redefined function.

  @Description: Check that a class can redefine static functions if the return type
                is generic and satisfies the rule from the assertion 

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

public interface CreateP<T> {
    static func create_p(): T
}

public interface CreateC<T> {
    static func create_c(): T
}

open class Parent <: CreateP<Parent> {
    static public func create_p(): Parent {
        return Parent()
    }
}

public class Child <: CreateP<Child> & CreateC<Child> {
    static public func create_p(): Child {
        return Child()
    }
    static public func create_c(): Child {
        return Child()
    }
}

abstract class A<T> where T <: CreateP<T> {
    public static func f1(): T {
        return T.create_p()
    }
    public static func f2<U>(): T {
        return T.create_p()
    }
}

open class B<T> where T <: CreateP<T> {
    public static func f1(): T {
        return T.create_p()
    }
    public static func f2<U>(): T {
        return T.create_p()
    }
}

sealed abstract class C<T> where T <: CreateP<T> {
    public static func f1(): T {
        return T.create_p()
    }
    public static func f2<U>(): T {
        return T.create_p()
    }
}

interface I<T> where T <: CreateP<T> {
    static func f1(): T
    static func f2(): T {
        return T.create_p()
    }
    static func f3<U>(): T
    static func f4<U>(): T {
        return T.create_p()
    }
}

// Classes T1-T4 change the return type to a subtype of the original return type
class T1<U, V> <: A<V> where V <: CreateP<V> & CreateC<V>, U <: CreateP<U> & Object {
    public redef static func f1(): V {
        return V.create_c()
    }
    public redef static func f2<T>(): V {
        return V.create_c()
    }
}

class T2 <U, V> <: B<V> where V <: CreateP<V> & CreateC<V>, U <: CreateP<U> & Object {
    public redef static func f1(): V {
        return V.create_c()
    }
    public redef static func f2<T>(): V {
        return V.create_c()
    }
}

class T3<U, V> <: C<V> where V <: CreateP<V> & CreateC<V>, U <: CreateP<U> & Object {
    public redef static func f1(): V {
        return V.create_c()
    }
    public redef static func f2<T>(): V {
        return V.create_c()
    }
}

class T4<U, V> <: I<V> where V <: CreateP<V> & CreateC<V>, U <: CreateP<U> & Object {
    public redef static func f1(): V {
        return V.create_c()
    }
    public redef static func f2(): V {
        return V.create_c()
    }
    public redef static func f3<T>(): V {
        return V.create_c()
    }
    public redef static func f4<T>(): V {
        return V.create_c()
    }
}

// Classes T5-T8 do not change the return type
class T5<T> <: A<T> where T <: CreateP<T> {
    public redef static func f1(): T {
        return T.create_p()
    }
    public redef static func f2<U>(): T {
        return T.create_p()
    }
}

class T6<T> <: B<T> where T <: CreateP<T> {
    public redef static func f1(): T {
        return T.create_p()
    }
    public redef static func f2<U>(): T {
        return T.create_p()
    }
}

class T7<T> <: C<T> where T <: CreateP<T> {
    public redef static func f1(): T {
        return T.create_p()
    }
    public redef static func f2<U>(): T {
        return T.create_p()
    }
}

class T8<T> <: I<T> where T <: CreateP<T> {
    public redef static func f1(): T {
        return T.create_p()
    }
    public redef static func f2(): T {
        return T.create_p()
    }
    public redef static func f3<U>(): T {
        return T.create_p()
    }
    public redef static func f4<U>(): T {
        return T.create_p()
    }
}


main() {
    let tst1 = T1<Parent, Child>.f1()
    Assert.isTrue(tst1 is Child)

    let tst2 = T1<Parent, Child>.f2<Unit>()
    Assert.isTrue(tst2 is Child)

    let tst3 = T2<Parent, Child>.f1()
    Assert.isTrue(tst3 is Child)

    let tst4 = T2<Parent, Child>.f2<Unit>()
    Assert.isTrue(tst4 is Child)

    let tst5 = T3<Parent, Child>.f1()
    Assert.isTrue(tst5 is Child)

    let tst6 = T3<Parent, Child>.f2<Unit>()
    Assert.isTrue(tst6 is Child)

    let tst7 = T4<Parent, Child>.f1()
    Assert.isTrue(tst7 is Child)

    let tst8 = T4<Parent, Child>.f2()
    Assert.isTrue(tst8 is Child)

    let tst9 = T4<Parent, Child>.f3<Unit>()
    Assert.isTrue(tst9 is Child)

    let tst10 = T4<Parent, Child>.f4<Unit>()
    Assert.isTrue(tst10 is Child)

    let tst11 = T5<Parent>.f1()
    Assert.isTrue(tst11 is Parent)

    let tst12 = T5<Parent>.f2<Unit>()
    Assert.isTrue(tst12 is Parent)

    let tst13 = T6<Parent>.f1()
    Assert.isTrue(tst13 is Parent)

    let tst14 = T6<Parent>.f2<Unit>()
    Assert.isTrue(tst14 is Parent)

    let tst15 = T7<Parent>.f1()
    Assert.isTrue(tst15 is Parent)

    let tst16 = T7<Parent>.f2<Unit>()
    Assert.isTrue(tst16 is Parent)

    let tst17 = T8<Parent>.f1()
    Assert.isTrue(tst17 is Parent)

    let tst18 = T8<Parent>.f2()
    Assert.isTrue(tst18 is Parent)

    let tst19 = T8<Parent>.f3<Unit>()
    Assert.isTrue(tst19 is Parent)

    let tst20 = T8<Parent>.f4<Unit>()
    Assert.isTrue(tst20 is Parent)
}
