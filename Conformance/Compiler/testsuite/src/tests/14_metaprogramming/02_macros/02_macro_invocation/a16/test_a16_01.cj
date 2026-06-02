/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a16_01

  @Level:         1

  @Assertion:    14.2.2(16) The following is an example of a macro invocation without an attribute, one with an 
                 attribute, and one without parentheses.
                  ...

  @Description:  Positive check example
   
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

  @CompileWarning:      Ignore

*/

import std.ast.*
import aux_macros_01.*

func foo()
{
    print("In foo\n")
}

@echo class A {} // ok, class can only be defined in top-level, so is current macro invocation

func goo() {
    @echo func tmp() {} // ok, function can be defined in another function body,
    // so is current macro invocation
    // @echo class B {} // error, class can only be defined in top-level, so is current macro invocation
}

main(): Unit {
    @Twice(foo()) // After Macro expand: foo(); foo()
    // @Twice() // error, parameters in macro invocation can not be empty.
    @Joint[foo()](foo()) // After Macro expand: foo(); foo()
    // @Joint[foo()]() // error, parameters in macro invocation can not be empty.
    // @Joint[](foo()) // error, attribute in macro invocation can not be empty.
    @MacroWithoutParens
    var a: Int64 = 0 // After Macro expand: func foo() { var a: Int64 = 0 }
}
