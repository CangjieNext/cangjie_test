/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a03_01

  @Level:         1

  @Assertion: 4.5.2(3) The while expression first evaluates the expression after while
              (which is required to be of type Bool), and if the value of the expression is equal to true,
              the block after it is executed, then the value of the expression is recalculated and the
              loop is re-executed; if the value of the expression is equal to false, the loop is terminated
  @Description: Check that condition expression must be of type Bool
  @Mode: compileonly
  @Negative: yes

*/

main() {
    let t = None<Bool>
    while (t) { }
    0
}
