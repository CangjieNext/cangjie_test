/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Sp {
    var  v:Int64 = 0
    public  static let  s:Int64 = 1
    public func  f(a:Int64, b : Int64):Int64 {
        return  a + b
    }
    public func g(n! : Int64): Int64 {
        return n
    }
    public prop  p:Int64 {
        get() {
            return v
        }
    }
}

func commas(a : Int64, b : Int64) : Int64 {
    let t = (1 , 2)
    let arr = [ 1 , 2 , 3 ]
    let gen: Array< Int64 > = [ 4 , 5 ]
    return a + b + t[ 0 ] + arr[ 1 ] + gen[ 0 ]
}

func parens(x : Int64) : Int64 {
    let y = ( x + 1 ) * 2
    let z = Sp ( )
    if(x > 0) {
        return y
    }
    while(x < 0) {
        return Sp.s
    }
    match(x) {
        case 1 => 1
        case _ => z.p
    }
}

main() {
    let sp = Sp()
    println(sp.f( 1 , 2 ))
    println(sp.g( n : 3 ))
    println(commas(3 , 4))
    println(parens(5))
    println("done")
}
