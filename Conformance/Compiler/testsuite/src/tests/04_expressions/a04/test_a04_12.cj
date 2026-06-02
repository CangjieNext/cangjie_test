
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a04_12

  @Level:         1

  @Assertion: 4(4): Expressions can be composed into composite expressions. 
  @Description: Checks that quote and macros can be a part of the composite
                expression.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a04_12.cj  
  @CompileWarning: no

*/

import std.ast.*
import aux_a04_12.*
import utils.assert.Assert

var t1:Token = Token()
var t2:Token = Token(ILLEGAL)
var t3:Token = Token(STRING_LITERAL, "Welcome")
var t4:Token = Token(STRING_LITERAL, "to")
var t5:Token = Token(STRING_LITERAL, "Novosibirsk!")

let name = "user"
let mail = "mail_agent"

main() {
    var str = @Concat["Hello"](" " + "World" + "!\n") + 
            ("My address is" + 
            " " + 
            @Concat[name]("@" + mail + 
            "\n")) +
        ((quote($t1) + 
            quote($t2) + 
            quote($t3) + 
            quote($t4) + 
            quote($t5)).toString() + 
            "\n")

    Assert.isTrue(str is String)
    Assert.equals(
        "Hello World!\nMy address is user@mail_agent\n\"Welcome\" \"to\" \"Novosibirsk!\"\n", 
        str)
}
