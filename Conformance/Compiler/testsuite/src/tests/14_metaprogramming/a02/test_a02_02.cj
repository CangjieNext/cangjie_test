/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_a02_02

  @Level:         1

  @Assertion:   14(2)Therefore, Cangjie programming language provides the tokens type for describing code,
                supporting basic operations of converting code into data, concatenating code, and macro for
                code transformation during compilation.

  @Description: Check that tokens type supports basic operations of converting code into data,
                concatenating code
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    var code = quote(var G_Int = 490
        func foo() {
            var offset = Random().nextInt64()
            return G_Int + offset
        }
        main() {
            println(foo())
            0
        })

    // Converting code into data
    Assert.isTrue(code is Tokens)
    
    // Concatenating code
    var imports = quote(import std.random.Random)
    code = imports.concat(code)
    Assert.isTrue(code[0].kind == TokenKind.IMPORT)
}
