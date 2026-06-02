/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:           bug_0006063
  @Assertion:      0006063: Global variable initialization doesn't work as expected
  @Description:    Check bug 0006063 source code example.
  @Comment:        Tests the example from the spec: chapter 3.3.2.2
  @Mode:           compileonly
  @Negative:       yes
  @CompileWarning: no

  @Structure:    complex-main
  @Dependencies: a.cj b.cj
*/

main(): Int64 {
     print("${x}")
     print("${y}")
     print("${z}")
     return 1
}
