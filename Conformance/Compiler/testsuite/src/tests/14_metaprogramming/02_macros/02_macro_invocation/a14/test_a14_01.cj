/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a14_01

  @Level:         1

  @Assertion:    14.2.2(14) For macro invocations without parentheses, the parameter must be one of the following 
                 declarations or expressions:
                  - Function declaration
                  - Struct declaration
                  - Enum definition
                  - Enum constructor
                  - Class declaration
                  - Static initializer
                  - primary init functions and init functions in structs and classes
                  - Interface declaration
                  - Property definition
                  - Extend definition
                  - Variable declaration (except function parameters)
                  - Macro invocation expression

  @Description:  Check that macro calls without parentheses must be followed by an expression or declaration
   
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

  @Issue: 0006124

*/

import std.ast.*
import aux_macros.*

@classWrap[wrapped3] // macroWithAttrParam for functionDefinition
public func cls_member(): Bool { this.cls_member is () -> Bool }

public class TestA1401 {
    @addModif[public] // macroWithAttrParam for staticInit
    static var cls_member = 0
}

@addModif[public] // macroWithAttrParam for structDefinition
struct wrapped5 {
    @addModif[public] // macroWithAttrParam for structPrimaryInit
    wrapped5() {}

    @addModif[private] // macroWithAttrParam for structInit
    init(a: Int64) {}
}   

@addModif[public] // macroWithAttrParam for enumDefinition
enum wrapped6 {
    A | B | C | D
}

@addModif[abstract] // macroWithAttrParam for classDefinition
class wrapped7 {
    
    var _cls_member = 0

    @addModif[private] // macroWithAttrParam for classPrimaryInit
    wrapped7() {}

    @addModif[public] // macroWithAttrParam for classInit
    init(a: Int64) { this._cls_member = a }

    @addModif[private] // macroWithAttrParam for operatorFunctionDefinition
    operator func == (r: wrapped7){}
}

@addModif[;] // macroWithAttrParam for extendDefinition
extend wrapped7 {
    @addModif[public] // macroWithAttrParam for propertyDefinition
    mut prop cls_member: Int64 {
        get() { _cls_member }
        set(value) { _cls_member = value }
    }
}

@addModif[public] // macroWithAttrParam for interfaceDefinition
interface wrapped8 {}


main(): Unit {
    // macroInputExprWithParens
    @funcDecl(foo)
    @funcDecl[foo1](return 1555 - 1000)

    // macroInputExprWithoutParens
    @funcWrap      // macroWithoutAttrParam for variableDeclaration
    var a = 0.77

    @funcWrap[wrapped1] // macroWithAttrParam for variableDeclaration
    var a = 0.88
    @funcWrap[wrapped2] // macroWithAttrParam for macroExpression
    @letDecl(func_const)

    foo()
    foo1()
    wrapped()
    wrapped1()
    wrapped2()
}
