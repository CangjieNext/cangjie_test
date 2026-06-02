/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a15_01

  @Level:         1

  @Assertion:    3.2.3.2(15) The scope level is the same as the names defined in the type.

  @Description:  Checks that the scope level of type parameters and names defined in the type is same. 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

open class Test<T> {
    func f<T>() : Unit {
        f<T>()
    }

    func f1() : Unit {
        f<T1>()
    }

    func f2() : Unit {
        foo<T>()
    }
}

main() {}
