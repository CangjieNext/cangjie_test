/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_03_a01_01

  @Level:         1

  @Assertion:       8.6.3(1) Extensions are imported together with the type being extended and the interface 
                    implemented by the extension, and there is no need to specify the extension to be imported.

  @Description:     Check that extension imported together with the type being extended and implemented interface
                    and there is no need to specify the extension to be imported.

  @Mode:            run

  @Negative:        no

  @Structure:       complex-main

  @Dependencies:    aux_test_a01_01.cj

*/

package pkg1_1

import utils.assert.Assert
import pkg1.*

class MyClass1 <: myInterface {}

struct MyStruct1 <: myInterface {}

enum MyEnum1 <: myInterface { A }

main(): Unit {
    Assert.equals("myInterface myStaticFunc()", MyClass0.myStaticFunc())
    Assert.equals("MyClass0 myStaticFunc1()", MyClass0.myStaticFunc1())
    Assert.equals("myInterface myStaticFunc()", MyClass1.myStaticFunc())

    Assert.equals("myInterface myStaticFunc()", MyStruct0.myStaticFunc())
    Assert.equals("MyStruct0 myStaticFunc1()", MyStruct0.myStaticFunc1())
    Assert.equals("myInterface myStaticFunc()", MyStruct1.myStaticFunc())

    Assert.equals("myInterface myStaticFunc()", MyEnum0.myStaticFunc())
    Assert.equals("MyEnum0 myStaticFunc1()", MyEnum0.myStaticFunc1())
    Assert.equals("myInterface myStaticFunc()", MyEnum1.myStaticFunc())
}
