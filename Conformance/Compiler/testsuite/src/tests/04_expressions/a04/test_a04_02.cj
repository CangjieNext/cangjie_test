/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a04_02

  @Level:         1

  @Assertion: 4(4): Expressions can be composed into composite expressions. 
  @Description: Checks that String literals and variables can be a part of the
                composed expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

let str1 = "This"
var str2 = "is"
let str3 = "a String"
var str4 = "test"

main() {
    var str = "This " + "is" + " a " + "String test"
    Assert.equals("This is a String test", str)
    
    str = str1 + " " + str2 + " " + str3 + " " + str4
    Assert.equals("This is a String test", str)

    str = str1 + (" " + str2) + (" " + str3) + " " + str4
    Assert.equals("This is a String test", str)

    str = "This " + "is" + " a " + "String test"
    Assert.equals("This is a String test", str)

    str = str1 + " is " + str3 + " " + "test"
    Assert.equals("This is a String test", str)
}

