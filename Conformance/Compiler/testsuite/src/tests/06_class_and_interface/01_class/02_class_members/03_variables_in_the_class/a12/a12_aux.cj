/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: protected: The variable can only be accessed within this package or in a subclass.

  @Description: Definition of a class with protected member variables

  @Structure: complex-aux
*/

package a12

public open class A12Aux {
    protected var m1 = 1
    protected let m2 = 2
    static protected var s1 = 3
    static protected let s2 = 4
}

