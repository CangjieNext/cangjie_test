/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        bug_0005955

  @Assertion: Issue 0005955: In constant pattern, a newline character cannot be
                used as a separator between $ and the identifier following it.

  @Mode:        compileonly

  @Negative:    no

  @Issue:	      0005955

*/

main() {
    let v : Int32 = 0
    let p = """
$
{v}"""
}
