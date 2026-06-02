/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      bug_0005899

  @Assertion: Issue 0005899: ';' character as separator for the pattern matching
              expressions cannot be used sometimes.

  @Mode:      compileonly

  @Negative:  no

  @Issue:     0005899

*/

main() {
    var score: Int64 = 0
    var res: String = match (score) {; case 0 => "pass" ; case _ => "failed" ; }
}
