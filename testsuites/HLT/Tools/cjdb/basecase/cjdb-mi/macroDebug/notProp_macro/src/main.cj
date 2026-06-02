/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import define.*

public func add(): Unit {}


public class Cla{
    public init(){}
    let tuple_I:(Int8,Int16,Int32,Int64) = (-8,16,-32,64)
    let tuple_UI:(UInt8,UInt16,UInt32,UInt64) = (8,165,3206,64521)
    let tuple_F:(Float32,Float64) = (32.32,64.64)
    let tuple_O:(Bool,Rune) = (true,'C')

    public func fun_cla1(): Int32 {
        let v1 = this.tuple_I[2]
        return v1
    }
}

struct R {
    public var width: Int64
    public var height: Int64

    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height 
    }

    public func area(): Int64 {
        return width * height
    }

}

enum TimeUnit<T1, T2> {
        | Year(T1)
        | Month(T1, T2)
        | Day(T1, T2, T2)
        | Hour(T1, T2, T2, T2)
}


main(){
    @M_class
    var claIns1:Cla = Cla()
    
    @M_struct
    var r:R = R(10, 20)

    @M_enum(enum TimeUnit)

    
    return 0
}
