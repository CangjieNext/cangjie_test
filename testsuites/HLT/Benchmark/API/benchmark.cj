/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package bench
import std.ast.*
import std.collection.*

var all_bench_case_name = ArrayList<Tokens>()

public macro MAIN(a:Tokens){
    var code = parseDecl(a)
    if (!(code is MainDecl)) {
        throw Exception("Please use as @MAIN[main(){} , only support main!")
    }

    var res = quote(main(){
       println("case name"+"total time(ns),"+"each time(ns/op)")
    )
    var l = all_bench_case_name.size
    if (l == 0){
        throw Exception("Please use as @MAIN after @BENCHMARK!")
    }
    for (i in 0..l){
        res = res + all_bench_case_name[i]
    }
    res = res + quote(})
    return res
}

public macro BENCHMARK(a:Tokens,b:Tokens){
        var count0 =  parseExpr(a)
        var count1 = count0 as LitConstExpr
        var count2 = count1.getOrThrow()
        var count3 = count2.literal
        var count = count3  

        if (count.kind != INTEGER_LITERAL){
            throw Exception("Please use as @BENCHMARK[123]func test(){} , only INTEGER LITERAL in []!")
        }
        var name = Token()
        var res = Tokens()
        var flag_a = 0
        for (x in 0..b.size){
            var temp = b[x]
            if (temp.kind == IDENTIFIER){
                var name_str = "${b[x].value}_${count.value}"
                var name_id = Token(IDENTIFIER,name_str)
                name = Token(STRING_LITERAL, name_str)
                res = res + name_id
                all_bench_case_name.add(name_id+quote(();))
                continue
            }
            res = res + temp
            if (temp.kind == LCURL){
                flag_a = x
                break // find first func LCURL.
            }
        }
        var origin_code = Tokens()
        for (y in flag_a+1 ..b.size){
            origin_code = origin_code + b[y]
        }

        res = res +
        quote(
        var start = DateTime.now()
        var name = $name
        for (_ in 0..$a){
            $origin_code
            // origin code have last } here.
            var t = (DateTime.now() - start).toNanoseconds()
            var t_each = t / $a
            println("${name}"+": ${t}ns,"+"${t_each}ns/op")

        }
        )

        return res
}
