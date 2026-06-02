/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a02_10

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function overriding must comply with the following rules.

  @Assertion: 6.3.1.1(2)
              The name of the function must be the same as the overridden function.

  @Description: Check that a class can not use the 'override' modifier
                if the open public function in a sealed class
                and the overriding function in the implementing class have different names

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006084

*/

sealed class A {
    public open func f() {}
}

class C <: A {
    public override func test() {}
}

main() {
}
