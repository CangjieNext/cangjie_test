import std.collection.*


var map_top_k_int8 : HashMap<Int8, Int16> = HashMap<Int8, Int16>([(-3,-42), (2,12),(-72,1682)])
var map_top_empty_uint32 : HashMap<UInt32, UInt32> = HashMap<UInt32, UInt32>()
main() {
    // HashMap 元素key和value是基础类型
    var map_main_1 : HashMap<Int8, UInt8> = HashMap<Int8, UInt8>([(-3,42), (2,12),(-76,165)])
    var map_main_2 : HashMap<Int16, UInt16> = HashMap<Int16, UInt16>([(-39,150), (-90,1662),(76,675)])
    var map_main_3 : HashMap<Int32, UInt32> = HashMap<Int32, UInt32>([(-329,1750), (-910,1732),(-76,1675)])
    var map_main_4 : HashMap<UInt32, UInt32> = getLargeMap() //size大于100
    var map_main_5 : HashMap<Int64, UInt64> = HashMap<Int64, UInt64>([(-759,17550), (-830,18972),(906,32245)])
    var map_main_6 : HashMap<UInt16, Int64> = HashMap<UInt16, Int64>([(12,17750), (23,1836),(56,3594)])
    var map_main_7 : HashMap<Float16, Float32> = HashMap<Float16, Float32>([(1.2,17.750),(2.3,1.836),(5.6,3.594)])
    var map_main_8 : HashMap<Float32, Float64> = HashMap<Float32, Float64>([(12.15654,1.7755560), (2.457563,1.2545836),(5.6,35.45778794)])
    var map_main_9 : HashMap<Int32, Rune> = HashMap<Int32, Rune>([(-29,r'C'), (-10,r'a'),(76,r'N')])
    var map_main_10 : HashMap<Int64, Bool> = HashMap<Int64, Bool>([(129,true), (-1560,false),(756,true)])
    var map_main_11 : HashMap<Rune, cla> = HashMap<Rune, cla>([(r'K',cla(10)), (r'Q',cla(12))])
    var map_main_12 : HashMap<cla, cla> = HashMap<cla, cla>([(cla(1),cla(2))])
    map_main_12.add(cla(1),cla(10))
    var map_main_13 : HashMap<Bool, cla> = HashMap<Bool, cla>([(true,cla(4)),(true,cla(4)),(true,cla(6))])
    var map_main_14 : HashMap<UInt32, UInt32> = HashMap<UInt32, UInt32>() //空map




  return -1
}

func getLargeMap(){
    var map_f1 : HashMap<UInt32, UInt32> = map_top_empty_uint32
    for(i in 0..120){
        map_f1.add(UInt32(i+1),UInt32(i+110))
    }
   return map_f1
}

class cla <: Hashable & Equatable<cla>{
    public var x:Int64
    public init(x:Int64){this.x = x}
    public func hashCode() : Int64 {
        return Int64(x)
    }
     public operator func ==(right : cla) : Bool {
            return this.x == right.x
        }
    public operator func !=(right : cla) : Bool {
        var a = right
        return false
    }
}




/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
