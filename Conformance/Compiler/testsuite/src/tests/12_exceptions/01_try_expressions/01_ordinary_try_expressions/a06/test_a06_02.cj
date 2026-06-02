/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a06_02

  @Level:         1

  @Assertion:    12.1.1(6) 2. A try expression can contain zero or more catch blocks (there must be a finally block
                              when there is no catch block).

  @Description:  Checks that there must be a finally block when there is no catch block.

  @Mode:         compileonly        

  @Negative:     yes

  @Structure:    single

*/

main() {
    try {}
}
