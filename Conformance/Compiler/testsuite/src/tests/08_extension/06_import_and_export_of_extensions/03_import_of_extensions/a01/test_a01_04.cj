/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_03_a01_04

  @Level:         1

  @Assertion:       8.6.3(1) Extensions are imported together with the type being extended and the interface 
                    implemented by the extension, and there is no need to specify the extension to be imported.

  @Description:     Check that extension imported together with the type being extended and implemented non-exported 
                    interface will raise an error: enum.

  @Mode:            compileonly

  @Negative:        no

  @Structure:       complex-main

  @Dependencies:    aux_test_a01_02.cj

*/

package pkg1_1

import pkg2.*

main(): Unit {
    print(MyEnum0.myStaticFunc())
}
