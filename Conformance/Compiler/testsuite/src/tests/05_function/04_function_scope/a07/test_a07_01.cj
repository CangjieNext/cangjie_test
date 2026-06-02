/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a07_01

  @Level:         1

  @Assertion:       5.4(7)
                    interface Myinterface { 
                        func foo(): Unit 
                        static func bar(): Unit 
                    } 
                    class MyClass { 
                        func foo() {} 
                        static func bar() {} 
                    } 

  @Description:     Positive example from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

interface Myinterface { 
    func foo(): Unit 
    static func bar(): Unit 
} 

class MyClass { 
    func foo() {} 
    static func bar() {} 
} 

main() {
    Assert.isTrue(MyClass.bar is () -> Unit)
    var MyClassImpl = MyClass()
    Assert.isTrue(MyClassImpl.foo is () -> Unit)
}
