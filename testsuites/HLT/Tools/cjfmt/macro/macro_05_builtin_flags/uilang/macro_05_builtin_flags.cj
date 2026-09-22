/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func   test1() {
    let  s:String=@sourceFile()
    println(s)
}

func  test2(n!:Int64=@sourceLine()) {
    println(n)
}

@Deprecated["use  newFoo instead",since:"1.0.0"]
func  oldFoo() {
    test1()
}

func  newFoo() {
    test2()
}

@Frozen
public  func  frozenFunc():Unit{}

@Attribute[State]
var   cnt=0
@Attribute["Binding"]
var  bcnt=0

main() {
    oldFoo()
    newFoo()
}
