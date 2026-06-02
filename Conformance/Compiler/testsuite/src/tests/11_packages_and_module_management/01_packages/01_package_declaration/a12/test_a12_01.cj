/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         test_a12_01

  @Level:         1

  @Assertion:    11.1.1 `package` can be modified by `internal`, `protected`, or `public`. In particular, the root package cannot be modified by internal or protected.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

*/
internal package a

main() {
    return 0
}
