/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a02_01

  @Level:         1

  @Assertion:    12.1.1(2) Note that there must be at least one catch block or finally block. 

  @Description:  Checks the ordinary try expression will not be compiled when both catch & finally blocks are absent.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    try {}
}
