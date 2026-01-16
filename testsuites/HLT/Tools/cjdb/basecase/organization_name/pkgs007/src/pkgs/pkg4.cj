/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package org4::pkgs

import std.collection.*

var arrayInt32 : Array<Int32> = [321, 322, 10,120]
public var set_int32 : HashSet<Int32> = HashSet<Int32>([-74,9,-6954])
public var set_top_empty_uint32 : HashSet<UInt32> = HashSet<UInt32>()
var set_top_uint32 : HashSet<UInt32> = HashSet<UInt32>([32,126,5,6978,13354])


public struct Rec_r1 {
    public var rec_par_1 :UInt32=21
    public var var_pri :UInt32 =110
    public var set_rint32: HashSet<Int32> = set_int32
        public init(){}
        public init(p1:UInt32, p2:UInt32) {
            this.rec_par_1 = p1
            this.var_pri = p2
        }
    public var set_rbool : HashSet<Bool> = HashSet<Bool>([true,false,false,true])
    public var set_ruint8 : HashSet<UInt8> = Exter_Cla_1.fun_cs1(98)
    public static func fun_rs1(par_1:Int16):HashSet<Int16>{
        var set_rint16 : HashSet<Int16> = HashSet<Int16>([45,91,-56])
        set_rint16.add(par_1)
        return set_rint16
    }

    public func fun_r1(par_1:HashSet<Int32>,par_2!:HashSet<Int32>=HashSet<Int32>([458,931,-526])):HashSet<Int32>{
        var set_rint32 : HashSet<Int32> = par_2
        var set_size_1 : Int32 = Int32(par_1.size)
        set_rint32.add(all: par_1)
        var set_size_2 : Int32 = Int32(set_rint32.size)
        set_rint32.remove(458)
        var set_size_3 : Int32 = Int32(set_rint32.size)
      return set_rint32
    }
}


public open class Exter_Cla_1 {
    public var width : Int32 = arrayInt32[0]
    public var length : Int32 = arrayInt32[2]

    public Exter_Cla_1(para_f1: Int32,length:Int32){
        this.width =para_f1
        this.length =length
    }
    public init(){}
    private var set_pint32 : HashSet<Int32> = HashSet<Int32>([-764,92,6124])
    public var set_cint32 : HashSet<Int32> = HashSet<Int32>([-74,9,-6954])
    public static func fun_cs1(par_1:UInt8):HashSet<UInt8>{
        var set_cuint8 : HashSet<UInt8> = HashSet<UInt8>([14,29,6])
        set_cuint8.add(par_1)
        return set_cuint8
    }

    public func fun_c1(par_1:HashSet<UInt32>,par_2!:HashSet<UInt32>=set_top_uint32 ):HashSet<UInt32>{
        var set_cuint32 : HashSet<UInt32> = par_1
        set_cuint32.add(all: set_top_uint32)
        set_cuint32.remove(12)
        set_cuint32.add(UInt32(par_2.size))
        return set_cuint32
    }
}

public class Class_sub_exter1 <: Exter_Cla_1  {
    private var vP1 : Int32 =12
    public let para_sub1 : Int32 = 23
    public static var para_sub2 : Int32 = -90
    public Class_sub_exter1(){
        super(110,-120)
    }

    public var clazz_1_ins: Exter_Cla_1 = Exter_Cla_1() //父类的实例对象
    public let sub_cp1 : HashSet<Int32> =clazz_1_ins.set_cint32 //父类成员变量
    public var set_sub_uint32 : HashSet<UInt32> = HashSet<UInt32>([958,62654,121])

    public static func fun_sub_cs1(par_1:UInt8):HashSet<UInt8>{
        var set_cla_fun_s1 : HashSet<UInt8> = Exter_Cla_1.fun_cs1(119)
        set_cla_fun_s1.add(par_1)
        set_cla_fun_s1.add((UInt8(set_cla_fun_s1.size))+100)
        return set_cla_fun_s1
    }

    public func fun_sub_c1(par_1:UInt32):HashSet<UInt32>{
        var set_cla_fun_1 : HashSet<UInt32> = clazz_1_ins.fun_c1(set_sub_uint32)
        set_cla_fun_1.add(par_1)
        set_cla_fun_1.add((UInt32(set_cla_fun_1.size))+par_1)
        return set_cla_fun_1
    }
}
