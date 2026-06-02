/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a05_04

  @Level:         1

  @Assertion:       8.4(5) Extensions cannot access private members of the type being extended, other 
                    modifier-modified members can be accessed.

  @Description:     Check that extended members can't access to "private" members function in struct.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct MyStruct  {
    private func myBasePrivateFunc() {
        "myBasePrivateFunc()"
    }
}

extend MyStruct {
    func myGetFunc() {
        "${myBasePrivateFunc()}"
    }
}

main(): Unit { } 
