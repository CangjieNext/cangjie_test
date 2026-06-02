/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_02_a01_10

  @Level:         1
  @Assertion:    3.4.1.2(1) The private access modifier private is the most restrictive access level.
                 Members declared as private can only be accessed within the current scope.

  @Description:  Check private func of extention can't be accessed

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

*/

public struct TestA0110 {}

extend Foo {
    private func f1() {}
}

main() {
    TestA0110().f1()
}
