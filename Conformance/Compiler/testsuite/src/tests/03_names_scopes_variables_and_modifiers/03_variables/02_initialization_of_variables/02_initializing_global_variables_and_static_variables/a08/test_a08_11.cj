/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a08_11

  @Level:         1

  @Assertion:    3.3.2.2(8) Declaration of a global/static variable must initialize it immediately.
                 That is, the declaration must provide an initialization expression and be in the form
                 of let v = e or var v = e.

  @Description:  Checks that "var" declaration of global variable w/o immediate initializing is compiled with error.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

var gvInt: Int32

main() {
    gvInt = 32
}
