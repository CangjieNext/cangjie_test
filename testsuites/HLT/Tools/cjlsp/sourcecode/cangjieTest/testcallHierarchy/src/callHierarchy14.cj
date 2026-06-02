/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

public open class Rect{
    public var width:Int64
    protected var height:Int64
    private var area:Int64
    public init(w1:Int64,h1:Int64) {
        this.width = w1
        this.height =h1
        this.area = this.height* this.width
    }
    Rect(a:Int64){
        this.area = a
        this.height = a
        this.width = a
    }
}

class Cu <: Rect{
    private var length:Int64
    public init(w1:Int64,h1:Int64,l1:Int64){
        super(w1,h1)
        this.length = l1
    }
}
