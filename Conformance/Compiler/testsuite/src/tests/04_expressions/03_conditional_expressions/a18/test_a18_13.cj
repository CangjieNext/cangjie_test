/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a18_13

  @Level:         1

  @Assertion: 4.3(18) Note that in order to avoid the dangling-else problem, 
              the “body” of the if and else branch must be a block (even if it
              only contains only one expression), i.e., enclosed with a pair of
              braces. (The dangling else problem is the problem of not being 
              able to determine whether the else expr2 in a code such as if
              cond1 if cond2 expr1 else expr2 belongs to the inner if or the
              outer if. If it belongs to the inner if, the code should be
              interpreted as if cond1 (if cond2 expr1 else expr2); if it
              belongs to the outer if, the code should be interpreted as if 
              cond1 (if cond2 expr1)expr2. However, this is not a problem if we
              force to use curly brackets for the branches).
  @Description: Checks that `if` followed by the non-block expression, `else if`
                and non-block expression causes a compile error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore

*/

var i = 0
var c = 0

main() { 
    if (i < 0) c++ else if (i == 0) c = 100

    return
}
