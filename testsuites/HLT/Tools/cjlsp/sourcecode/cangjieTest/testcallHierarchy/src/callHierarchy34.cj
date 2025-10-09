/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

func test10(){}
func test10(a:Int64){}
func test10(a:Int64,b:Int64){}
func test10(a:Int64,b:Bool){}
func test10(a:Int64,b:Int64,c:Bool,d!:Float32){}


func test10_1(){
    test10()
    test10(6)
    test10(8, true)
    test10(6, 3, false, d: 6.888)
}
