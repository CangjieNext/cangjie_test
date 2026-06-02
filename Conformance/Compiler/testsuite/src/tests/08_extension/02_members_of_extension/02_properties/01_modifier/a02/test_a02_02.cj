/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a02_02

  @Level:         1

  @Assertion:       8.2.2.1(2) Properties modified with private can only be used inside this extension and are not 
                    visible outside.

  @Description:     Check that properties defined inside extensions with private modifier are not visible outside: 
                    type extension.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issue:           6124

*/

type MyType = (Int32, Rune)

extend MyType {
    private prop p1: Int64 { 
        get() { 1 }
    }
}

main(): Unit {
    var myVar: MyType = (12, 'D')
    print("${myVar.p1}")
}
