/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a01_01

  @Level:         1

  @Assertion:    14.2.2(1)  Macro invocation expressions comply with the following syntax rules:
                  macroExpression
                      : '@' identifier macroAttrExpr?
                      (macroInputExprWithoutParens | macroInputExprWithParens)
                      ;
                  macroAttrExpr
                      : '[' quoteToken* ']'
                      ;
                  macroInputExprWithoutParens
                      : functionDefinition
                      | operatorFunctionDefinition
                      | staticInit
                      | structDefinition
                      | structPrimaryInit
                      | structInit
                      | enumDefinition
                      | caseBody
                      | classDefinition
                      | classPrimaryInit
                      | classInit
                      | interfaceDefinition
                      | variableDeclaration
                      | propertyDefinition
                      | extendDefinition
                      | macroExpression
                      ;
                  macroInputExprWithParens
                      : '(' macroTokens ')'
                      ;
                  macroTokens 
                      : (quoteToken | macroExpression)*
                      ;
 
  @Description:  Check macroExpression syntax
  
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj
*/

import std.ast.*
import aux_macros.*

@classWrap[wrapped3] // macroWithAttrParam for functionDefinition
public func cls_member(): Bool { this.cls_member is () -> Bool }

public class TestA0101 {
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
