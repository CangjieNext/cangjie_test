/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_21_a02_02

  @Level:         1

  @Assertion: 4.21(2)
              The syntax of the coalescing expression is defined as:

              coalescingExpression
                  : logicDisjunctionExpression ('??' logicDisjunctionExpression)*
                  ;

  @Description: Check that missing required first logicDisjunctionExpression cuases a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

main() {
    var c1: ?Int64 = 0;
    ?? c1;
    return
}
