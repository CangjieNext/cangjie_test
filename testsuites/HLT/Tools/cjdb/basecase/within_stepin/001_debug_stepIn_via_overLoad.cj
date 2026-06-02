/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



enum TimeUnit1 {
    | Year
    | Year(Int32)
    | Month(Int32, Int32)
    | Month(Int32)
}
 var arrayTopInt64 : Array<Int64> =[12, 23, 34]
main() {
    var cla = Clazz_1(12,10)
    var funPar = cla.fun_1(12,10,para_3:1)
    let time1 = TimeUnit1.Year
    let time2 =  Foo.A.f1() //enum的实例成员函数
    var vm_1 = cla.f_withoutBody(45)
    var vm_2 = Clazz_2(20)
    var vm_3 = cla.fun_1(12 , para_2: funPar)
    var vm_4 = cla.fun_1(12) //默认参数
    var vm_5 = cla.fun_1(12,20,para_3:10) //三参重载
    var rec = Rectangle_ex(12) //struct实例
    var vm_6= Clazz_1.fun_s1(64,pa_2:-20) //静态重载，默认参数
    var vm_7= Clazz_1.fun_s1("Hello",pa_2:"_test") //静态重载，插值string
    let vm_8 =  Foo.f2(Foo.B) //enum的静态成员函数
    let vm_9 =  arrayTopInt64
    var vm_10 =  rec.fun_c1(Int32(arrayTopInt64[1])) //struct实例函数(默认值)：内部级联调用
    var vm_11 =  Rectangle_ex.fun_s1(Clazz_1.fun_s1(64,pa_2:-20)) //struct静态函数(默认值)：内部级联调用

    return 0
}
class Clazz_1 {
    public var width: Int32 = 10
    public var length: Int32 = 20
    public init (par_1: Int32, par_2: Int32,par_3!: Int32=10) {
            this.width = par_1
            this.length = par_2
        }
    public func f_withoutBody(): Unit {}
    public func f_withoutBody(para_1: Int32): Unit {}
    public func fun_1(para_1: Int32 , para_2!: Int32 = 1): Int32 {
        var a1: Int32  = para_1
            var b1: Int32 = para_2
            a1 = -5
            b1 = para_2 + 3
        return a1 + b1
    }

     public func fun_1(para_1: Int32, para_2: Int32 ,para_3!: Int32 =-10): Int32 {
        var pri_v1: Int32 = para_1
        var pri_v2: Int32 = para_2
        var pri_v3: Int32 = para_3
     return pri_v1 + pri_v2+para_3
    }

    public static func fun_s1(pa_1:Int64): Int64 {
       var p_arr = arrayTopInt64.clone()
       var va1 =arrayTopInt64[1]
       return va1+pa_1
    }

    public static func fun_s1(pa_1:Int32,pa_2!:Int32,pa_3!:Int32 =19): Int32 {
       var va1 =pa_1
       return va1+pa_2+pa_3
    }
    public static func fun_s1(pa_1:String,pa_2!:String): String {
       var str_1 : String = "cangjie"
       var vstr1="${str_1}"//插值字符串
       return pa_1+" "+vstr1+pa_2
        }

}

enum Foo {
	A | B | C
	func f1(): Int64 {
		return f2(this)
	}
	static func f2(v: Foo): Int64 {
		return match (v) {
			case A => 0
			case B => 1
			case C => 2
        }
    }
prop item: Int64 {
	get() {
	return this.f1()
		}
	}
}

struct Rectangle_ex {
    public var width: Int32 = 10
    public var var_m1: Int32 =-1
    public var var_withNoVal: Int32
    private static var var_pri :Int32 =21
    public init (var_m1:Int32){
        this.var_withNoVal =52
        this.var_m1 =var_m1
    }

func fun_c1(v1:Int32 ,para_2!:Int32= -2) :Int32{
   var p_arr = Clazz_1(12,10).fun_1(Int32(Foo.B.f1()))
   return p_arr +v1
   }
static func fun_s1(v1:Int32 ,para_2!: Int32= -2) :Int32{
   var p_arr = Clazz_1.fun_s1(Foo.f2(Foo.C)) //级联调用
   return v1+Int32(p_arr)
   }

}

class Clazz_2 {
    public var width: Int32 = 10
    public var length: Int32 = 20
    public var par_tmp: Int32
    public init (par_1: Int32) {
            this.width = par_1
            this.par_tmp = 50
        }
    }
