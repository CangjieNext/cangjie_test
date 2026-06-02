// EXEC-PIPE-0: %pwd_to_ld_path %compiler %cmp_opt -Woff unused %n.cj %macro_lib -o %output
// (not Windows)RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*

main() {
    var a = quote(,)
    println(a.toString()) // 1 token
    a = Tokens()
    println(a.toString()) // 0 token
    a = quote(}}})
    println(a.toString())
    a = quote({{{}}})
    println(a.toString())
    a = quote({{{)
    println(a.toString())
    a = quote(
     a   }
{ bb
{aa
{  ddd
+
+}}}
xx
    )
    println(a.toString())
    a = quote(
 xx}}d%t^
@% / *-re+
*/{ ][]aa}. .   
ww
    )
    println(a.toString())
}

/* SCAN-IN
,

} } }
{ { { } } }
{ { {

a }
{ bb
    { aa
        { ddd
            +
            + } } }
xx


xx } } d % t ^
@% / * - re +
* / {][] aa }..
ww
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
