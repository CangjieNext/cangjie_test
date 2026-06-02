/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Comment: This assertion is a part of the list with the following heading:
            Variables in class can be declared with the following modifiers.

  @Assertion: private: A variable declared with modifier private can only be accessed in this class.

  @Description: Definition of a class with private member variables

  @Structure: complex-aux
*/

package a08

public class A08Aux {
    private var x = 1
    private let y = 2

    static private var a = 1
    static private let b = 1
}