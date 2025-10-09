/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


var top_c1 = C1<Int32>(10)

main() {
    let mc_u8 = C1<UInt8>(100)
    var mc_m1 = mc_u8.length //实例成员变量
    var mc_ms2 = C1<UInt16>.par_s1 //静态成员变量
    var mc_ms3 = C1<UInt32>.fun_cs1(32) //静态成员函数
    let mc_m2 = C1<UInt64>(10).fun_c1(32) //实例成员函数

    var mr_ins = R1<Int16>(12)
    var mr_m1 = mr_ins.width //实例成员变量
    var mr_ms2 = R1<Int16>.par_s1 //静态成员变量
    let mr_ms3 = R1<Int32>.fun_rs1(32) //静态成员函数
    var mr_m2 = R1<Int64>(10).fun_r1(32) //实例成员函数

    var val_ge1 = TimeUnit1<Int32,UInt32>.Month(-32)
    var val_ge2 = TimeUnit1<UInt32,Float32>.fun_s1(3.12)  //static
    let val_ge3 = TimeUnit1<Rune,Bool>.Month(r'K').f1(r'J') //实例

    let mc_ins = C2<UInt8,Int16,Float64,Bool,Rune>(8,-16,1.64,false,r'J')
    var mc_c3 = mc_ins.num4 //let定义
    var mc_c4 = mc_ins.num5 //var定义
    var mc_c5 = mc_ins.fun_1() //实例

    var c2_ins = C2<Int32, Int16, Int8, Int64,Unit>(10, 21, 34, 45,())
    var arrayrec01 : Array<C1<UInt32>> = [C1<UInt32>(132)]
    var mc_q = C1<C1<UInt32>>(C1<UInt32>(132))
    var m_num2 = f_top() //top_level



    return 0
}

struct R1<T> {
    public static var var_R1 : Int16 = 10
    private var var_pri : Int16 = 12
    public var width: T
    public var length: T
    public let r_1: Int64 = C1<Int64>(-12).length
    // 构造函数
    public init (par_1: T, par_2: T) {
        this.width = par_1
        this.length = par_2
    }
    public init (side: T) {
        this(side, side)
    }
    public func fun_r1(par_1:T):T{
    var par_f1 = C1<Int32>(100).length
    let par_return = par_1
    return par_return
    }

    public static var par_s1: Int32 = C1<Int32>(12).width
   public static func fun_rs1(par_1:T):T{
    var par_fs1 = C1<Int32>(100).width
    let par_return = par_1
    return par_return
    }
}

enum TimeUnit1<X,Y> {
    |Month(X)
    |Year(X)
    public func f1(par_1:X) :X{
    	    var var_m1 =par_1
    	    let var_m2 =par_1
    		return var_m1
    	}

    public 	static func fun_s1(par_1:Y) :Y{
    	    var var_s1 =par_1
    		return var_s1
    	}
}

open class C1<T> {
    // 成员变量
    public var width: T
    public var length: T
    public init (side: T) {
        this(side, side)
    }
    public init (par_1: T, par_2: T) {
        this.width = par_1
        this.length = par_2
    }

     public func fun_c1(par_1:T):T{
        var par_c1 = R1<UInt16>(200).length
        let par_return = par_1
        return par_return
        }

       public static var par_s1: Int16 = R1<Int16>(-12).width
       public static func fun_cs1(par_1:T): T{
        var par_fs1 = R1<Float16>(10.12).width
        let par_return = par_1
        return par_return
        }
}

class C2<T1,T2,T3,T4,T5> {
    // 成员变量
    public var num1: T1
    private var num2: T2
    protected var num3: T3
    public let num4: T4
    public var num5: T5
    public static var num11: Int8 = 10
    public init (pa_1: T1, pa_2: T2, pa_3: T3, pa_4: T4, pa_5: T5) {
        this.num1 = pa_1
        this.num2 = pa_2
        this.num3 = pa_3
        this.num4 = pa_4
        this.num5 = pa_5
    }

    public func fun_1(): Array<C1<Int64>>{
     let mc_1 = C1<Int64>(10) //c1的实例
     let mc_2 :C1<T2> //c1的实例
     var arrayrec01 : Array<C1<Int64>> = [mc_1]
     var mc_v = C1<Array<C1<Int64>>>(arrayrec01)
     return arrayrec01
    }
}

func f_top(): C1<Bool> {
    var f_c1 = C1<Bool>(true)
    return f_c1
}

