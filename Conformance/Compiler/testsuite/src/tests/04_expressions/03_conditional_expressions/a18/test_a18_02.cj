/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a18_02

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
  @Description: Checks that the body of if-expression can be a non-empty block.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

var i = 0

var cnt = 0
var cnt1 = 0
var cnt2 = 0
var cnt3 = 0
var cnt4 = 0

main() { 
    if (i < 0) {
        cnt++
    }
 
    if (i < 0) {
        cnt++
    } else {
        cnt--
    }

    if (i < 0) {
        cnt++
    } else if (i == 1) {
        cnt--
    } 

    if (i < 0) {
        cnt++
    } else if (i == 1) {
        cnt--
    } else {
        cnt1++
    }

    if (i < 0) {
        cnt++
    } else if (i == 1) {
        cnt--
    } else if (i == 2) {
        cnt1++
    }

    if (i < 0) {
        cnt++
    } else if (i == 1) {
        cnt--
    } else if (i == 2) {
        cnt1++
    } else {
        cnt1--
    }

    if (i < 0) {
        cnt++
    } else if (i == 1) {
        cnt--
    } else if (i == 2) {
        cnt1++
    } else {
        cnt1--
    }

    if (i < 0) {
        cnt++
    } else if (i == 1) {
        cnt--
    } else if (i == 2) {
        cnt1++
    } else if (i == 3) {
        cnt1--
    }

    if (i < 0) {
        cnt++
    } else if (i == 1) {
        cnt--
    } else if (i == 2) {
        cnt1++
    } else if (i == 3) {
        cnt1--
    } else {
        cnt2++
    }

    if (i < 0) {
        cnt++
    } else if (i == 1) {
        cnt--
    } else if (i == 2) {
        cnt1++
    } else if (i == 3) {
        cnt1--
    } else if (i == 4) {
        cnt2++
    }

    if (i < 0) {
        cnt++
    } else if (i == 1) {
        cnt--
    } else if (i == 2) {
        cnt1++
    } else if (i == 3) {
        cnt1--
    } else if (i == 4) {
        cnt2++
    } else {
        cnt2--
    }

    if (i < 0) {
        cnt++
    } else if (i == 1) {
        cnt--
    } else if (i == 2) {
        cnt1++
    } else if (i == 3) {
        cnt1--
    } else if (i == 4) {
        cnt2++
    } else if (i == 5) {
        cnt2--
    }

    if (i < 0) {
        cnt++
    } else if (i == 1) {
        cnt--
    } else if (i == 2) {
        cnt1++
    } else if (i == 3) {
        cnt1--
    } else if (i == 4) {
        cnt2++
    } else if (i == 5) {
        cnt2--
    } else {
        cnt3++
    }
}
