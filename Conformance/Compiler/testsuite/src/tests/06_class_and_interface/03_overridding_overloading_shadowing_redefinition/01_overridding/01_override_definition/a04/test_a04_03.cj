/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a04_03

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function overriding must comply with the following rules.

  @Assertion: 6.3.1.1(4)
              The return type of the function must be the same as
              or be a subtype of the return type of the overridden function.

  @Description: Check that a class can override instance functions if the return type
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

public open class Parent <: CreateP<Parent> {
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
    public func f1(): T
    public open func f2(): T {
        return T.create_p()
    }
}

open class B<T> where T <: CreateP<T> {
    public open func f(): T {
        return T.create_p()
    }
}

sealed abstract class C<T> where T <: CreateP<T> {
    public open func f(): T {
        return T.create_p()
    }
}

interface I<T> where T <: CreateP<T> {
    func f1(): T
    func f2(): T {
        return T.create_p()
    }
}

// Classes T1-T4 change the return type to a subtype of the original return type
class T1<U, V> <: A<V> where V <: CreateP<V> & CreateC<V>, U <: CreateP<U> & Object {
    public override func f1(): V {
        return V.create_c()
    }
    public override func f2(): V {
        return V.create_c()
    }
}

class T2 <U, V> <: B<V> where V <: CreateP<V> & CreateC<V>, U <: CreateP<U> & Object {
    public override func f(): V {
        return V.create_c()
    }
}

class T3<U, V> <: C<V> where V <: CreateP<V> & CreateC<V>, U <: CreateP<U> & Object {
    public override func f(): V {
        return V.create_c()
    }
}

class T4<U, V> <: I<V> where V <: CreateP<V> & CreateC<V>, U <: CreateP<U> & Object {
    public override func f1(): V {
        return V.create_c()
    }
    public override func f2(): V {
        return V.create_c()
    }
}

// Classes T5-T8 do not change the return type
class T5<T> <: A<T> where T <: CreateP<T> {
    public override func f1(): T {
        return T.create_p()
    }
    public override func f2(): T {
        return T.create_p()
    }
}

class T6<T> <: B<T> where T <: CreateP<T> {
    public override func f(): T {
        return T.create_p()
    }
}

class T7<T> <: C<T> where T <: CreateP<T> {
    public override func f(): T {
        return T.create_p()
    }
}

class T8<T> <: I<T> where T <: CreateP<T> {
    public override func f1(): T {
        return T.create_p()
    }
    public override func f2(): T {
        return T.create_p()
    }
}


main() {
    let tst1 = T1<Parent, Child>().f1()
    Assert.isTrue(tst1 is Child)

    let tst2 = T1<Parent, Child>().f2()
    Assert.isTrue(tst2 is Child)

    let tst3 = T2<Parent, Child>().f()
    Assert.isTrue(tst3 is Child)

    let tst4 = T3<Parent, Child>().f()
    Assert.isTrue(tst4 is Child)

    let tst5 = T4<Parent, Child>().f1()
    Assert.isTrue(tst5 is Child)

    let tst6 = T4<Parent, Child>().f2()
    Assert.isTrue(tst6 is Child)

    let tst7 = T5<Parent>().f1()
    Assert.isTrue(tst7 is Parent)

    let tst8 = T5<Parent>().f2()
    Assert.isTrue(tst8 is Parent)

    let tst9 = T6<Parent>().f()
    Assert.isTrue(tst9 is Parent)

    let tst10 = T7<Parent>().f()
    Assert.isTrue(tst10 is Parent)

    let tst11 = T8<Parent>().f1()
    Assert.isTrue(tst11 is Parent)

    let tst12 = T8<Parent>().f2()
    Assert.isTrue(tst12 is Parent)
}
