/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_03_a01_03

  @Level:         1
  @Assertion:       2.1.10.3(1) Member functions, member attributes and a static initializer can also be defined in
                    struct.

  @Description:     Check that there are no errors when creating a struct with a static initializer.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006136,0006405

*/

import utils.assert.Assert

struct S {
    static init() { Assert.isTrue(true) }
}

main() {}
