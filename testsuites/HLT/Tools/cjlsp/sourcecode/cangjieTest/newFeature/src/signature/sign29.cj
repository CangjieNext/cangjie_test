/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

open class Point{
    var x:Int32 =1
    var y:Int32 = 2
    init(x:Int32,y:Int32){
        this.x = x
        this.y = y
    }
}

class Color <:Point {
    var color:String ="green"
    init(x:Int32,y:Int32,color:String){
        super(x,y)
        this.color = color
    }
}
