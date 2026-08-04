/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.ast.*
import std.collection.*


class ObservedClassInitDeclVisitor <: Visitor {
    public func visit(decl: Decl): Unit {
        if (decl is PrimaryCtorDecl) {
            breakTraverse()
        }
        match (decl) {
            case funcDecl: FuncDecl where funcDecl.identifier.value == "init" =>
                breakTraverse()
            case _ =>
                breakTraverse()
        }
        breakTraverse()
    }
}

class CustomDialogVarVisitor <: Visitor {
    var hasController = false
    public func visit(varDecl: VarDecl): Unit {
        match (varDecl) {
            case varDecl: VarDecl =>
                let typeName = varDecl.declType.toTokens().toString()
                let customDialogControllerVarName = varDecl.identifier.value
                hasController = true
                breakTraverse()
        }
        breakTraverse()
    }
}

class ComponentVarDeclVisitor <: Visitor {
    public var varDecls: ArrayList<VarDecl> = ArrayList<VarDecl>()
    public func visit(classDecl: ClassDecl): Unit {
        for (decl in classDecl.body.decls) {
            match (decl) {
                case v: PrimaryCtorDecl =>
                    breakTraverse()
                case funcDecl: FuncDecl =>
                    if (funcDecl.identifier.value == "init") {
                        breakTraverse()
                    }
                case varDecl: VarDecl =>
                    varDecls.add(varDecl)
                case _ =>
                    breakTraverse()
            }
            breakTraverse()
        }
    }
}

let bindFunctions: HashMap<String, Int64> = HashMap<String, Int64>([
    ("bindContentCover", 1), ("bindSheet", 1), ("description", 0)
])

let bindFunctionsNamedParam: HashMap<String, Int64> = HashMap<String, Int64>([
    ("bindMenu", 0), ("bindContextMenu", 0)
])


class VisitBuilder <: Visitor {
    var ident : ArrayList<String> = ArrayList<String>()
    let thisView: Tokens

    init(thisView: Tokens) {
        this.thisView = thisView
    }

    override public func visit(curNode: CallExpr) {
        if (!(curNode.callFunc is MemberAccess)) {
            return
        }
        var ma = (curNode.callFunc as MemberAccess).getOrThrow()
        if (let Some(index) <- bindFunctions.get(ma.field.value)) {
            var builder = curNode.arguments[index].expr
            var callBind = CallExpr(quote(bind($builder, $thisView)))
            curNode.arguments[index].expr = callBind
        } else if (let Some(index) <- bindFunctionsNamedParam.get(ma.field.value)) {
            if (curNode.arguments[index].identifier.value == "builder") {
                var builder = curNode.arguments[index].expr
                var callBind = CallExpr(quote(bind($builder, $thisView)))
                curNode.arguments[index].expr = callBind
            }
        }
    }

    override public func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
    }
}


class VisitBuilderSimple1 <: Visitor {
    var exprs : ArrayList<Expr> = ArrayList<Expr>()
    override public func visit(curNode: CallExpr) {
        if (!(curNode.callFunc is MemberAccess)) {
            return
        }
        var ma = (curNode.callFunc as MemberAccess).getOrThrow()
        if (let Some(index) <- bindFunctions.get(ma.field.value)) {
            exprs.add(curNode.arguments[index].expr)

        } else if (let Some(index) <- bindFunctionsNamedParam.get(ma.field.value)) {
            if (curNode.arguments[index].identifier.value == "builder") {
                exprs.add(curNode.arguments[index].expr) 
            }
        }
    }
}

class VisitBuilderSimple2 <: Visitor {
    var tokens : ArrayList<Tokens> = ArrayList<Tokens>()
    override public func visit(curNode: CallExpr) {
        if (!(curNode.callFunc is MemberAccess)) {
            return
        }
        var ma = (curNode.callFunc as MemberAccess).getOrThrow()
        if (let Some(index) <- bindFunctions.get(ma.field.value)) {
            tokens.add(quote($(curNode.arguments[index].expr)))

        } else if (let Some(index) <- bindFunctionsNamedParam.get(ma.field.value)) {
            if (curNode.arguments[index].identifier.value == "builder") {
                tokens.add(quote($(curNode.arguments[index].expr)))
            }
        }
    }
}


func getVarDecls(classDecl: ClassDecl): ArrayList<VarDecl> {
        let visitor = ComponentVarDeclVisitor()
        classDecl.traverse(visitor)
        return visitor.varDecls
}