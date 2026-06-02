/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main() {
    let decl = ClassDecl(quote(
        public class test{
        test(@Anno1 @Anno2 private let a: Int64, private let b: Int64){}
        }
    ))
    for(d in decl.body.decls){
        for(p in (d as PrimaryCtorDecl).getOrThrow().funcParams){
        println(p.toTokens())
        match(p){
            case x: MacroExpandParam =>
                println(x.macroInputs)
                println(x.macroInputDecl.toTokens())
            case x => println(x.toTokens())
        }
        println('>>>>>>>>>>>>>>>>>>>>>>')
        }
    }
}

/* SCAN
@Anno1
@Anno2
private let a: Int64
@Anno2 private let a: Int64
@Anno2
private let a: Int64
>>>>>>>>>>>>>>>>>>>>>>
private let b: Int64
private let b: Int64
>>>>>>>>>>>>>>>>>>>>>>
*/
