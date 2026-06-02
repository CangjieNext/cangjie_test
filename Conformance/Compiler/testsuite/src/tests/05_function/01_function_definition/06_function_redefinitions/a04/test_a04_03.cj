/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_01_06_a04_03

  @Level:         1

  @Assertion:       5.1.6(4) Regarding inheritance, for a function in a subclass with the same name and exactly the 
                    same parameter type as the parent class, if its return type is a subtype of the version in the 
                    parent class, it constitutes an override and does not constitute a redefinition. (This is because 
                    the subclass has a scope different from the parent class.)

  @Description:     Check that a function in a subclass with the same name and exactly the same parameter type as the 
                    parent class, if its return type is a subtype of the version in the parent class, does not 
                    constitute a redefinition: user defined class.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

open class myParentClass0 {}

class myClass {}

open class myParentClass1 {
    open public func funcPublic(a: Int32): myParentClass0 { myParentClass0() }
}

class myClass1 <: myParentClass1 {
    public func funcPublic(a: Int32): myClass { myClass() }
}

main() {
}
