/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            03_02_02_a08_06

  @Level:         1
  @Assertion:       3.2.2(8) For classes and interfaces, the name in this class is at a higher level of scope than the
                    name in the superclass. The name in a subclass may shadow or override the name in the superclass.

  @Description:     Check that it is not possible to use in a super interface a name declared in a sub interface.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006086,0006133

*/

interface Base {
    func f() { a }
}

interface C <: Base {
    func a() {}
}

main() {}
