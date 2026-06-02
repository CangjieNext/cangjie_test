/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a08_04

  @Level:         1

  @Assertion:    3.4.2(8) mut indicates that the member is of mutable semantics, See function for details

  @Description:  Check that classes cannot contain mut functions.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
*/

class C {
    public mut func foo() {}
}

main() {
    return 0
}
