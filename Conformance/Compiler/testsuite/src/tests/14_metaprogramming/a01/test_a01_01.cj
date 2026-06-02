/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_a01_01

  @Level:         1

  @Assertion:   14(1) Metaprogramming allows code to be represented as operable data objects,
                which can be added, deleted, modified, and queried. 

  @Description: Check the metaprogramming allows code to be represented as operable data objects
  
  @Mode:        run

  @Negative:    no

*/

import std.ast.*
import std.collection.ArrayList

main(): Unit {
    var code = quote(import std.random.Random
        var G_Int = 490
        func foo() {
            var offset = Random().nextInt64()
            return G_Int + offset
        }
        main() {
            println(foo())
            0
        })

    let imports = quote(import std.random.Random)

    let top_consts = quote(var G_Int = 490)

    let top_funcs = quote(
        func foo() {
            var offset = Random().nextInt64()
            return G_Int + offset
        })

    let main_func = quote(
        main() {
            println(foo())
            0
        })
    
    var quoted_code_0 = quote($code)

    var quoted_code_1 = imports + top_consts + top_funcs
    quoted_code_1.concat(main_func)

    var expr = parseDecl(main_func) 
    var main_expr = match (expr as MainDecl ) { 
        case Some(v) => v
        case None => throw Exception()
    }
    var main_token = main_func.get(1)
}
