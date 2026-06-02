/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a08_05

  @Level:         1

  @Assertion:       5.4(8) Extension member functions 
                    Additional member functions can be declared in the extension. Its scope is all extensions of the 
                    type being extended, while being limited by access modifiers.  

  @Description:     Check that private additional member functions can't be accessed outside extension scope: struct 
                    extension.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issue:           6281

*/

struct myStruct {}
extend myStruct {
    private func foo(): Unit {}
}

main() {
    var myStructImpl = myStruct()
    myStructImpl.foo()
}
