/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a24_01

  @Level:         1

  @Assertion:    14.2.2(24) In the preceding example, when users invoke macros such as @Twice, @Joint, and
                 @MacroWithoutParens, the code in the macro definition is compiled and executed, and the word 
                 Compiling the macro... is printed, the execution result is used as a new syntax tree node to 
                 replace the original macro invocation expression.  

  @Description:  Check that macros such as @Twice, @Joint, and@MacroWithoutParens print
                 Compiling the macro... during compilation
   
  @Mode:         compileonly

  @Negative:     no

*/

import std.ast.*
import aux_macros_01.*

func foo()
{
    print("In foo\n")
}

main(): Unit {
    @Twice(foo()) // After Macro expand: foo(); foo()
    @Joint[foo()](foo()) // After Macro expand: foo(); foo()
    @MacroWithoutParens
    var a: Int64 = 0 // After Macro expand: func foo() { var a: Int64 = 0 }
    foo()
}
