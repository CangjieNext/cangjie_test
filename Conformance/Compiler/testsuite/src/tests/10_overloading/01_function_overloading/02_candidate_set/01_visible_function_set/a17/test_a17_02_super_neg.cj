/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a17_02_super_neg

  @Level:         1

  @Assertion:   10.1.2.1(17) 4) If the function invocation is in the form of super.f(...),
                the visible set includes non-static member functions in the super class or super interfaces.
  

  @Description:   Compiler emits error that 
                  overridden function 'Verify' should have 'open' modifier

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

                
*/

open class Parent {
 
    private static func SVerify(arg:Int8) {
    }

    func Verify(arg:Int8) {
        SVerify(arg)
    }

}


open class Klass <: Parent {

    override open public func Verify(arg:Int8) {
        super.Verify(arg - 1)
    }
}


main(ina :Array<String>) {

    0
}

