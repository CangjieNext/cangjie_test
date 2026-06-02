/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a05_01

  @Level:         1

  @Assertion: 4.5.2(5) An example of a basic while-let expression.
  @Description: Check example code
  @Mode: compileonly
  @Negative: no
  @Issue: 6473

*/

main(): Int64 {
    var x: Option<Int64> = Option<Int64>.Some(100)

    // while-let expression
    while (let Some(v) <- x ) {
        print( "x has value" )
        //x=...  // commented
        x = None // added
    }

    return 0
}
