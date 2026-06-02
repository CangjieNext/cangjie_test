/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @Description:  Aux file with some macros for testing
 
  @Structure:    complex-aux
 
  @MacroLib
*/
 
macro package aux_macros
import std.ast.*
 
public macro PI(input: Tokens): Tokens {
    print("Compiling the macro `PI` ...\n")
    return quote(3.1415)
}
 
public macro PlusOne(input: Tokens): Tokens {
    print("Compiling the macro `PlusOne` ...\n")
    quote($input + 1)
}
 
public macro PlusOne(ty: Tokens, input: Tokens): Tokens {
    print("Compiling the macro `PlusOne` ...\n")
    quote($input + $ty(1))
}
 
public macro Concat(first: Tokens, second: Tokens): Tokens {
    print("Compiling the macro `Concat` ...\n")
    quote($(first) + $(second))
}
 
public macro GenerateClass(access: Tokens, name: Tokens): Tokens {
    print("Compiling the macro `GenerateClass` ...\n")
    quote($access class $name {
        public var variable: Int64
        init() {
            this.variable = 5
        }
    })
}
 
class VarDeclCjVisitor <: Visitor {
    public var cpp_code = Tokens()
    override public func visit(varDecl: VarDecl): Unit {
        match ((varDecl.declType as PrimitiveType).getOrThrow().keyword.kind) {
            case INT64 => cpp_code += Token(IDENTIFIER, "long")
            case INT32 => cpp_code += Token(IDENTIFIER, "int")
            case INT16 => cpp_code += Token(IDENTIFIER, "short")
            case INT8 => cpp_code += Token(IDENTIFIER, "char")
            case _ => cpp_code += Token(IDENTIFIER, "auto")
        }
        
        cpp_code += varDecl.identifier
        cpp_code += Token(ASSIGN)
        cpp_code += varDecl.expr.toTokens()
 
    }
}
 
public macro ToCpp(code: Tokens): Tokens {
    print("Compiling the macro `ToCpp` ...\n")
    let cj_code = parseDecl(code)
    var vis = VarDeclCjVisitor()
    cj_code.traverse(vis) 
    quote($(vis.cpp_code.toString()))
}
 
class VarDeclFixer <: Visitor {
    public var right_code = Tokens()
    override public func visit(varDecl: VarDecl): Unit {
        right_code += Token(VAR)
        right_code += varDecl.identifier
        right_code += Token(COLON)
 
        match ((varDecl.expr as LitConstExpr).getOrThrow().literal.kind) {
            case INTEGER_LITERAL => right_code += Token(INT64)
            case FLOAT_LITERAL => right_code += Token(FLOAT64)
            case _ => ()
        }
        
        right_code += Token(ASSIGN)
        right_code += varDecl.expr.toTokens()
 
    }
}
 
public macro AddType(code: Tokens): Tokens {
    print("Compiling the macro `AddType` ...\n")
    let cj_code = parseDecl(code)
    var vis = VarDeclFixer()
    cj_code.traverse(vis)
    quote($(vis.right_code.toString()))
}