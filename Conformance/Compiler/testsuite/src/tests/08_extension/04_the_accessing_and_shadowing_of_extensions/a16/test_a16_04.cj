/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a16_04

  @Level:         1

  @Assertion:       8.4(16) If the constraints of two extensions are different and the constraints of the two 
                    extensions have an inclusive relationship, members in the extension with a looser constraint 
                    can be directly used in the extension with a stricter constraint; otherwise, members in the 
                    extension with a stricter constraint can not be directly used.

  @Description:     Check that members defined in stricter constraint can not be directly used in the extension with 
                    a looser constraint: enum extensions.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

enum myEnum<P> {
    K
}

extend myEnum<U> where U <: ToString { 
    func myUFunc() {
        mySFunc() / 3
    }
}

extend myEnum<S> where S <: Int64 { 
    func mySFunc() {
        99
    }
}

main(): Unit {}
