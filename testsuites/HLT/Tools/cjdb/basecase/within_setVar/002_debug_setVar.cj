/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



 var arrayTopInt32 : Array<Int32> = [12, 23, 34]
main() {
    var cla = Clazz_1(12,10)
    let vm_1 =  Foo.A.f1() //enum的实例成员函数
    var vm_2= cla.fun_1(12) //默认参数
    var vm_3 = cla.fun_1(12,para_2:10) //
    var rec = Rectangle_ex(12,10) //struct实例
    var vm_4= Clazz_1.fun_s1(64,pa_2:-20)
    var vm_5= Clazz_1.fun_s1("Hello",pa_2:"_test") //静态重载，插值string
    let vm_6=  Foo.f2(Foo.B) //enum的静态成员函数
    let vm_7 =  Foo.fun_s1()
    var vm_8 =  rec.fun_c1(Int32(arrayTopInt32[1]))
    var vm_9 =  Rectangle_ex.fun_s1(Clazz_1.fun_s1(64,pa_2:-20))



    return 0
}
class Clazz_1 {
    public var width: Int32 = 10
    public var length: Int32 = 20
    public static let par_s1: Int32 = 10
    public init (par_1: Int32, par_2: Int32,par_3!: Int32=10) {
            this.width = par_1
            this.length = par_2
        }
    public func fun_1(para_1: Int32 , para_2!: Int32 = 1): Int32 {
        var a1: Int32  = para_1
            var b1: Int32 = para_2
            b1 = para_2 + 3
        return a1 + b1
    }

    public static func fun_s1(pa_1:Int32,pa_2!:Int32=10): Int32{
       var p_arr = arrayTopInt32.clone()
       var va1 =arrayTopInt32[1]
       return va1+pa_1
    }

    public static func fun_s1(pa_1:String,pa_2!:String):String{
       var str_1 : String = "cangjie"
       var vstr1="${str_1}"//插值字符串
       return pa_1+" "+vstr1+pa_2
        }

}

enum Foo {
	A | B | C
	func f1(): Int32 {
	    var var_m1: Int32 =10
		return var_m1
	}

	static func fun_s1(): Int32 {
	    var var_s1: Int32 =10
		return var_s1
	}

	static func f2(v: Foo): Int64 {
		return match (v) {
			case A => 0
			case B => 1
			case C => 2
        }
    }
}

struct Rectangle_ex {
    public static var width: Int32 = 10
    public var var_m1: Int32 =-1
    public var var_withNoVal: Int32
    private static var var_pri :Int32 =21
    public init (par_1: Int32,var_m1:Int32){
        this.var_withNoVal =52
        this.var_m1 =var_m1
    }

func fun_c1(v1:Int32 ,para_2!:Int32= -2) :Int32{
   var p_arr = Clazz_1(12,10).fun_1(Int32(Foo.B.f1()))
   return p_arr +v1
   }
static func fun_s1(v1:Int32 ,para_2!: Int32= -2) :Int32{
   var p_arr = Clazz_1.fun_s1(10) //级联调用
   return v1+Int32(p_arr)
   }

}
