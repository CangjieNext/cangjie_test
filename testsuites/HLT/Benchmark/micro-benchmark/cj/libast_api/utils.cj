/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.ast.*
import std.collection.*

public func getVarDeclsFromClassDecl(input: ClassDecl): ArrayList<VarDecl> {
        let list: ArrayList<VarDecl> = ArrayList<VarDecl>() 
        let body =input.body.decls
        for (token in body) {
            if (!(token is VarDecl)) {
                continue
            }

            let field = match (token as VarDecl) {
                case Some(v) => list.add(v)
                case None => ()
            }
        }
        list
}

public func getFuncParamsFromFuncDecl(input: FuncDecl): ArrayList<FuncParam> {
        let list: ArrayList<FuncParam> = ArrayList<FuncParam>() 
        var params = input.funcParams
        for (param in params) {
            list.add(param)
        }
        list
}

public func getFuncParamsFromClassDecl(input: ClassDecl): ArrayList<FuncParam> {
        let list: ArrayList<FuncParam> = ArrayList<FuncParam>() 
        let bodyTokens = input.body.decls
        for (token in bodyTokens) {

            var funcDecl = match (token as FuncDecl) {
                case Some(v) => v
                case None => continue
            }

            var params = funcDecl.funcParams
            for (param in params) {
                list.add(param)
            }
        }
        list
}


public func judgeModifiersHasStatic(modifiers: Tokens): Bool {
        var isStatic = false
        for (modifier in modifiers) {
            if (modifier.kind == TokenKind.STATIC) {
                isStatic = true
                break
            }
        }
        isStatic
}


func getFuncDeclBlockNodes(classDecl: ClassDecl): ArrayList<ArrayList<Node> > {
    let d = classDecl.body.decls
    let bd = ArrayList<ArrayList<Node> >()
    for(decl in d) {
        if (decl is FuncDecl) {
            bd.add((decl as FuncDecl).getOrThrow().block.nodes)
        }
    }
    return bd
}

func getCtorParamType(classDecl: ClassDecl): ArrayList<TypeNode> {
        let allFields = ArrayList<TypeNode>()
        for (item in classDecl.body.decls) {
            if (let Some(ctor) <- (item as PrimaryCtorDecl)) {
                for (param in ctor.funcParams) {
                    allFields.add(param.paramType)
                }
            }
        }
        allFields
}