/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import   define.*

var   counter=0

@ModifyFunc
func  myFunc() {
    counter++
}

var  m:Int64=@Foo[1  +](2  +  3)

@Foo[  public  ]
class  Data {
    var  count:Int64=100
    public  init(  ){}
}

@Bar
@Foo[  public  ]
func  decorated():Int64{
    return   m
}

main() {
    let x = 3
    let   y=2
    @dprint(x)
    @dprint(x + y)
    let  a:Int64=@testDef(1+2)
    println( "a = ${a}" )
    let b = @testDef(  @testDef( 2 * 3 )  +  @testDef( 1 + 3 )  )
    println( "b = ${b}" )
    myFunc(123)
    println( "counter = ${counter}" )
    println( "m = ${m}" )
    println( "count = ${Data().count}" )
    println( "decorated = ${decorated()}" )
}
