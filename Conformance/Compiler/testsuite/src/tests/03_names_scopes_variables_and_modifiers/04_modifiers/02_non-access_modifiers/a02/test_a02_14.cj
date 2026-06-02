/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a02_14

  @Level:         1

  @Assertion:    3.4.2(2) open indicates that the instance member can be overridden by a subclass,
                 or that the class can be inherited by a subclass, See class for details

  @Description:  Check that subclass cannot use private functions of superclass.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
*/

open class C1 {
    private func f1() {
        return "foo"
    }
}

class C2 <: C1 {

}

main() {
    var obj = C2()
    print(obj.f1())
}
