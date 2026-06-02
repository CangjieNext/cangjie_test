/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a06_01

  @Level:         1

  @Assertion:    12.1.1(6) 2. A try expression can contain zero or more catch blocks (there must be a finally block
                              when there is no catch block).

  @Description:  Checks that the try expression has to contain at least one catch or finally block.

  @Mode:         compileonly        

  @Negative:     no

  @Structure:    single

*/

open class E1 <:  Exception {}
open class E2 <:  Exception {}
open class E3 <:  Exception {}
main() {
// test case #1 (some number of catch blocks and no finally one)
    try {
    } catch (e: E1) {
    } catch (e: E2) {
    } catch (e: E3) {}
// test case #2  (no catch blocks with finally one)
    try {
    } finally {}
}
