/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a02_05

  @Level:         1

  @Assertion:       8.2.2.1(2) Properties modified with private can only be used inside this extension and are not 
                    visible outside.

  @Description:     Check that properties defined inside extensions with private modifier are not visible outside: 
                    struct extension.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issue:           6124

*/

enum MyEnum { A }

extend MyEnum {
    private prop p1: Int64 { 
        get() { 1 }
    }
}

main(): Unit {
    print("${MyEnum.A.p1}")
}
