/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a14_12

  @Level:         1

  @Assertion: 6.1.2.4(14)
              Static member functions are declared with the static keyword,
              it does not belong to an instance, but to the type it is in.

  @Description: Check that a static function with paramters and witn a unit return type
                with public access modifier
                can not be called on an instance object of the class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class Test {
    public static func f1(x: Int64, y: String) {}

    func test() {
        let tst = Test()
        tst.f1()
    }
}

main() {
    Test().test()
}