/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a08_01

  @Level:         1

  @Assertion:       5.4(8) Extension member functions 
                    Additional member functions can be declared in the extension. Its scope is all extensions of the 
                    type being extended, while being limited by access modifiers.  

  @Description:     Check that additional member functions can be defined in the extension.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6281

*/
import utils.assert.Assert

type myType = Int64
extend myType { 
    func foo(): Unit {}
    public func publicInfo(): String {"This is public info about MyType"}
    private func privateInfo(): String {"This is private info about MyType"}
}

struct myStruct {
    var i = 0 
}
extend myStruct {
    func foo(): Unit {}
    static func info(): String {"This is myStruct"}
    public func publicInfo(): String {"This is public info about myStruct ${i}"}
    private func privateInfo(): String {"This is private info about myStruct"}
    mut func f(): Unit { i += 1 } 

}

main() {
    var myVar: myType = 12
    Assert.isTrue(myVar.foo is () -> Unit)
    Assert.isTrue(myVar.publicInfo is () -> String)
    Assert.equals("This is public info about MyType", myVar.publicInfo())

    Assert.isTrue(myStruct.info is () -> String)
    Assert.equals("This is myStruct", myStruct.info())
    var myStructImpl = myStruct()
    Assert.isTrue(myStructImpl.publicInfo is () -> String)
    Assert.equals("This is public info about myStruct 0", myStructImpl.publicInfo())
    myStructImpl.f()
    Assert.equals("This is public info about myStruct 1", myStructImpl.publicInfo())

}
