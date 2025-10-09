/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

func ff28(b:Int64,aa:Float32){
    return aa
}

func ff28_1(x:Int32,y:String){}
func test28(){
    let `int`:Float32 = 1.9
    var d2:Int32 = 6
    var d3 = ff28_1(d2,"4556")
    var d4 = ff28(5,`int`)
}
