/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: inputs.cj utils.cj visitors.cj
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f inputs.cj utils.cj visitors.cj -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color

import std.ast.*
import std.collection.*

@Test
@Measure[TimeNow(Nanos)]
class TestGqlSerialize {
    let gqlSerializeInput1: Tokens
    let gqlSerializeInput2: Tokens
    let gqlSerializeInput3: Tokens
    let gqlSerializeInput4: Tokens

    TestGqlSerialize() {
        this.gqlSerializeInput1 = cangjieLex(gqlSerializeStr1)
        this.gqlSerializeInput2 = cangjieLex(gqlSerializeStr2)
        this.gqlSerializeInput3 = cangjieLex(gqlSerializeStr3)
        this.gqlSerializeInput4 = cangjieLex(gqlSerializeStr4)
    }

    @Bench
    func BenchmarkGqlSerialize_ClassDecl_001():Unit {
        let decl = parseDecl(gqlSerializeInput1)
        match (decl) {
            case cd: ClassDecl => // Expand class declaration.
                let result = serializeClass(cd)
            case ed: EnumDecl => // Expand enum declaration.
                let result = serializeEnum(ed)
            case _ => // Otherwise, report error.
                ()
        } 
    }

    @Bench
    func BenchmarkGqlSerialize_ClassDecl_002():Unit {
        let decl = parseDecl(gqlSerializeInput2)
        match (decl) {
            case cd: ClassDecl => // Expand class declaration.
                let result = serializeClass(cd)
            case ed: EnumDecl => // Expand enum declaration.
                let result = serializeEnum(ed)
            case _ => // Otherwise, report error.
                ()
        } 
    }
    @Bench
    func BenchmarkGqlSerialize_EnumDecl_001():Unit {
        let decl = parseDecl(gqlSerializeInput3)
        match (decl) {
            case cd: ClassDecl => // Expand class declaration.
                let result = serializeClass(cd)
            case ed: EnumDecl => // Expand enum declaration.
                let result = serializeEnum(ed)
            case _ => // Otherwise, report error.
                ()
        } 
    }
    @Bench
    func BenchmarkGqlSerialize_EnumDecl_002():Unit {
        let decl = parseDecl(gqlSerializeInput4)
        match (decl) {
            case cd: ClassDecl => // Expand class declaration.
                let result = serializeClass(cd)
            case ed: EnumDecl => // Expand enum declaration.
                let result = serializeEnum(ed)
            case _ => // Otherwise, report error.
                ()
        } 
    }

    func serializeClass(cd: ClassDecl): Tokens {
        let modifiers = cd.modifiers.toTokens()
        let identifier = cd.identifier
        var superTypes = Tokens()
        var body = Tokens()
        let allFields = ArrayList<(Token, TypeNode)>() // All member variables and its' type info.

        // Add 'Serializable<T>' to its super types.
        if (cd.superTypes.size == 0) {
            superTypes = quote(Serializable<$(identifier)>)
        } else {
            superTypes = quote($(cd.superTypes) & Serializable<$(identifier)>)
        }

        for (item in cd.body.decls) {
            if (let Some(ctor) <- (item as PrimaryCtorDecl)) {
                // Collection all member variables.
                for (param in ctor.funcParams) {
                    allFields.add((param.identifier, param.paramType))
                }
            }
            // Add decl to body directly.
            body += item.toTokens()
        }

        return quote(
            $modifiers class $identifier <: $superTypes {
                $body
            }
        )
    }


    func serializeEnum(ed: EnumDecl): Tokens {
        let modifiers = ed.modifiers.toTokens()
        let identifier = ed.identifier
        var superTypes = Tokens()
        var body = Tokens()
        let fields = ArrayList<Token>()

        // Add 'Serializable<T>' to its super types.
        if (ed.superTypes.size == 0) {
            superTypes = quote(Serializable<$(identifier)>)
        } else {
            superTypes = quote($(ed.superTypes) & Serializable<$(identifier)>)
        }

        for (ctor in ed.constructors) {
            fields.add(ctor.identifier)
            body += quote(| $ctor
            )
        }

        for (decl in ed.decls) {
            body += quote(  
                $decl
            )
        }

        return quote(
            $modifiers enum $identifier <: $superTypes {
                $body
            }
        )
    }
}