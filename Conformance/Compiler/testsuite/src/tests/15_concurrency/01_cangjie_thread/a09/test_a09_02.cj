/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a09_02

  @Level:         1
@Assertion:    15.1(9) The syntax of the spawn expression is as follows.

                    spawnExpression
                        :'spawn' lambdaExpression
                        ;

                 Where the optional argument of the spawn expression is type
                 ThreadContext.

  @Description:  Checks that spawn expression with ThreadContext returns Future
  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

  @Issue:        0006087, 0006088

*/
import utils.assert.*

main(): Int64 {
    let context = MainThreadContext()

    let th = spawn (context) {
        2
    }
    Assert.equals(2, th.get(), reason: "Thread result should match")
    0
}
