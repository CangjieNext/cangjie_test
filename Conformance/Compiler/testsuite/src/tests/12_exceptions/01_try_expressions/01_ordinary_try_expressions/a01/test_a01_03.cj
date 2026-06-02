/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a01_03

  @Level:         1

  @Assertion:    12.1.1(1) ordinary try expressions (try expressions in this section unless stated otherwise)
                           have three parts: a try block, zero or more catch blocks and an optional finally block.

  @Description:  Checks the catch block w/o try keyword.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    catch {}
}

