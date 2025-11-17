/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package org3::pkgs

import std.collection.*

public var map_top_int8 : HashMap<Int8, Int16> = HashMap<Int8, Int16>([(-3,-42), (2,12),(-72,1682)])
public var map_top_empty_uint32 : HashMap<UInt32, UInt32> = HashMap<UInt32, UInt32>()


public class Cla_exter_1 {
    public var intValue:Int64 = 23
    public var str : String = "cangjie_T"
    public init() {}
    public init(value:Int64, str:String) {
        this.intValue = value
        this.str = str
    }
    public var map_c_1 : HashMap<Int32, Rune> = HashMap<Int32, Rune>([(-29,r'C'), (-10,r'a'),(76,r'N')])
    public static func fun_cs1(par_1:HashMap<Int32, Rune>,par_2:Rune):HashMap<Int32, Rune>{
        var map_c_return : HashMap<Int32, Rune> = par_1
        map_c_return.add(Int32(12),r'F')
        map_c_return.add(Int32(12),r'Q')
        map_c_return[12] =par_2
        return map_c_return
    }

    public func fun_c1(par_1:HashMap<Int32, Rune>,par_2!:HashMap<Int32, Rune> = map_c_1):HashMap<Int32, Rune>{
        var map_c_return : HashMap<Int32, Rune> = par_1
        map_c_return.add(all: par_2)
        map_c_return.add(Int32(110),r'Q')
        return map_c_return
    }
}


public struct rec_exter_1 {
    public var rec_par_1 :UInt32=21
    public var var_pri :UInt32 =110
    public var map_rm :HashMap<Int32, Rune> = Cla_exter_1().fun_c1(HashMap<Int32, Rune>([(19,r'n'), (90,r'p'),(46,r'J')]))
    public init(){}
    public init(p1:UInt32, p2:UInt32) {
        this.rec_par_1 = p1
        this.var_pri = p2
    }
    public var map_r_1 : HashMap<Int64, Bool> = HashMap<Int64, Bool>([(129,true), (-1560,false),(756,true)])
    public static func fun_rs1(par_1:Int64,par_2:Bool,par_3:HashMap<Int64, Bool>):HashMap<Int64, Bool>{
        var map_r_1 : HashMap<Int64, Bool> = par_3
        map_r_1.add(Int64(par_1),par_2)
        map_r_1.add(64,false)
        map_r_1.remove(64)
        return map_r_1
    }

    public var map_r_2 : HashMap<UInt16, Int64> = HashMap<UInt16, Int64>([(12,17750), (23,1836),(56,3594)])
    public func fun_r1(par_1:HashMap<UInt16, Int64>,par_2!:HashMap<UInt16, Int64> = map_r_2):HashMap<UInt16, Int64>{
        var map_r_return : HashMap<UInt16, Int64> = par_1
        var map_size_1 : UInt16 = UInt16(map_r_return.size)
        map_r_return.add(all: par_2)
        var map_size_2 : Int64 = Int64(map_r_return.size)
        map_r_return.add(map_size_1,map_size_2)
        return map_r_return
    }
}

public var map_top_char : HashMap<Int32, Rune> = HashMap<Int32, Rune>([(-29,r'C'), (-10,r'a'),(76,r'N')])
