/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a14_02

  @Level:         1

  @Assertion:   14.1(14) The Cangjie programming language provides the Tokens type to indicate the token result
                obtained after lexically analyzing the source text. 

  @Description: Checking the result of lexically analyzing the source text is Tokens
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    var t1 = cangjieLex("")
    var t2 = cangjieLex("func foo() { return \"It's cool in space\" }")
    var t3 = cangjieLex("""
                        main(){
                            1
                        }""", true)
    var t4 = cangjieLex("""
                        func foo() { 
                            var s = "It's cool in space!!!"
                            println(s)
                            return s
                        }""", true)
    
    Assert.isTrue(t1 is Tokens)
    Assert.isTrue(t2 is Tokens)
    Assert.isTrue(t3 is Tokens)
    Assert.isTrue(t4 is Tokens)

    Assert.equals("", t1.toString())
    Assert.equals("func foo() { return \"It's cool in space\" }", t2.toString())
    Assert.equals("main() {\n    1\n}", t3.toString())
    Assert.equals("func foo() {\n    var s = \"It's cool in space!!!\"\n    println(s)\n    return s\n}", t4.toString())
}
