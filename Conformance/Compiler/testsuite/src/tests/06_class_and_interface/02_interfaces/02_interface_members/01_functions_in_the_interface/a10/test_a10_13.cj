/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a10_13

  @Level:         1

  @Assertion: 6.2.2.1(10)
              When a static member function is called directly using the interface type name,
              it will be compiled with an error if the function contains a direct 
              or indirect call to another static function that is not implemented
              in the interface (by itself or by another interface).

  @Description: Check that static functions that calls through several proxies
                an unimplemented non-generic static function of the superinterface
                can not be called through the type

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface S {
    static func f(): Unit
}

interface I <: S {
    static func proxy10() {
        proxy9()
    }
    static func proxy9() {
        proxy8()
    }
    static func proxy8() {
        proxy7()
    }
    static func proxy7() {
        proxy6()
    }
    static func proxy6() {
        proxy5()
    }
    static func proxy5() {
        proxy4()
    }
    static func proxy4() {
        proxy3()
    }
    static func proxy3() {
        proxy2()
    }
    static func proxy2() {
        proxy1()
    }
    static func proxy1() {
        f()
    }
    static func g() {
        proxy10()
    }
}

main() {
    I.g()
}