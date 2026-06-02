/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a16_01

  @Level:         1
  @Assertion:   A.2.5(16)
                spawnExpression
                    : SPAWN NL* trailingLambdaExpression
                    ;


  @Description: Check trivial spawn expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

main() {
    spawn

    {
        3 + 1
    }

    return 0
}
