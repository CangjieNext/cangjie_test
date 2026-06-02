/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_04_a06_02

  @Level:         1
  @Assertion:       2.1.10.4(6) The members modified with private within struct are visible only within the definition
                    of struct.

  @Description:     Check that a private member variable is invisible outside the struct.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single
  @CompileWarning:  no

*/

struct S {
    private let v = 1
}

main() {
    S().v
    0
}
