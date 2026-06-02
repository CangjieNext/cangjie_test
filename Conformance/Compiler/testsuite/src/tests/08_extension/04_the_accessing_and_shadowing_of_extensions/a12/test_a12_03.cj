/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a12_03

  @Level:         1

  @Assertion:       8.4(12) The non-private–modified members in other extensions of the same type can be accessed 
                    directly in the extension (without any prefix).

  @Description:     Check that private–modified extensions members are not accessible directly from other extensions
                    of the same type: struct.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct MyStruct  {}

extend MyStruct {
    private func myPrivateFunc() {
        "myPrivateFunc()"
    }
}

extend MyStruct {
    func myGetFunc() {
        "${myPrivateFunc()}"
    }
}

main(): Unit { } 
