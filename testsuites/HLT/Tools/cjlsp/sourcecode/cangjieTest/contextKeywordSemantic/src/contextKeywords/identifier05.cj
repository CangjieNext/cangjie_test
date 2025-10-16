/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.contextKeywords

func test5(public:Int64,redef:Float64){}

func test5_1<T>(abstract:T,open:Int64) {}

class CC5{
    CC5(
        open:String,var redef!:Int64 = 0
    ){}
}


func f5(){
    var a1 = test5(1,2.0)
    var a2 = CC5("ggg", redef: 5).redef
}
