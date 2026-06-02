/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a08_03

  @Level:         1

  @Assertion:       8.2.2.1(8) Properties definitions within extensions do not support the open, override, 
                    redef modifiers.

  @Description:     Check that class property defined inside the extensions does not support redef modifier.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issue:           6124

*/

class MyClass {
    prop p: String {
        get() { "true" }
    }
}

extend MyClass {
    redef prop p: String { 
        get() { "false" }
    }
}

main(): Unit { }
