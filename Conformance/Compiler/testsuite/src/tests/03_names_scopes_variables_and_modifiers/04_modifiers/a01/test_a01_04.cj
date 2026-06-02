/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_a01_04

  @Level:         1

  @Assertion:    3.4 (1) Cangjie provides a number of modifiers, which fall into the following two main categories.
                    Access modifiers 
                    Non-access modifiers 

  @Description:  Сhecks that method without open modifier cannot be overridden in subclass

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

open class A {
    func method() { return true }
}

class B <: A {
    override func method() { return false }
}

main() {

}
