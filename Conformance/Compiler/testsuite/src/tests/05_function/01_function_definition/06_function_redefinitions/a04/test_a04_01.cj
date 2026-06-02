/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_01_06_a04_01

  @Level:         1

  @Assertion:       5.1.6(4) Regarding inheritance, for a function in a subclass with the same name and exactly the 
                    same parameter type as the parent class, if its return type is a subtype of the version in the 
                    parent class, it constitutes an override and does not constitute a redefinition. (This is because 
                    the subclass has a scope different from the parent class.)

  @Description:     Check that a function in a subclass with the same name and exactly the same parameter type as the 
                    parent class, if its return type is a subtype of the version in the parent class, does not 
                    constitute a redefinition.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

type myType = Int64
extend myType {
    func double(a: Int64): Int64 { a + a}
}

open class myParentClass0 {
    private var myPrivateVar: Int32
    myParentClass0(a: Int32) {
        this.myPrivateVar = a
    }
}
class myClass0 <: myParentClass0 {
    myClass0(a: Int32) {
        super(a)
    }
}

open class myParentClass1 {
    open public func funcPublic(a: Int32): myParentClass0 { myParentClass0(a) }
    open public func funcPublic1(a: myType): myType { a }
}

class myClass1 <: myParentClass1 {
    public func funcPublic(a: Int32): myClass0 { myClass0(a) }
    public func funcPublic1(a: myType): Int64 { a + 12 }
}

main() {
    var myParentClass1Impl = myParentClass1()
    var myClass1Impl = myClass1()

    Assert.equals(0, myParentClass1Impl.funcPublic1(0))
    Assert.isTrue(myParentClass1Impl.funcPublic is (Int32) -> myParentClass0)
    Assert.isTrue(myParentClass1Impl.funcPublic1 is (myType) -> myType)

    Assert.equals(12, myClass1Impl.funcPublic1(0))
    Assert.isTrue(myClass1Impl.funcPublic is (Int32) -> myParentClass0)
    Assert.isTrue(myClass1Impl.funcPublic is (Int32) -> myClass0)
    Assert.isTrue(myClass1Impl.funcPublic1 is (myType) -> Int64)
}
