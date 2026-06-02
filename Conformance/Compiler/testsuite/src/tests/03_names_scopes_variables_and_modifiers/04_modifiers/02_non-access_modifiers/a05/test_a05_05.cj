/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a05_05

  @Level:         1

  @Assertion:    3.4.2(5) static means that the member is a static member, and static members cannot be accessed
                 through instance objects, See class for details

  @Description:  Check that static members cannot be accessed through a struct instance.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
*/

struct S {
    static let E = 2.71
}

main() {
    var obj = S()
    obj.E
    return 0
}
