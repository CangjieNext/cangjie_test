/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import pkg_class.*
import pkg_struct.*
import pkg_enum.*
import pkg_func.*
import std.collection.*

/*top level member*/
public var v_top_1:Int64 = -64
public let v_top_2:Bool = (-64 << 3) >0
var enum_top = Yellow(10,20,30,40,1.0,2.0,3.0,true,r'C',"你好，cangjie。")
let string_top = returnString()
let vm_arr_top:Array<Cla_1> = [Cla_1(59),Cla_1(-61)] //Array<Cla_1>
public var tuple_top1 :(Float32,Range<Int64>,String)= (32642.32,-10..=10:2,"cangjie go")

public func fun_top1():Unit{
    let claIns1 = Cla()
    let vf_1 = claIns1.tuple_UI[1] << 2
    claIns1.fun_cla1()
}

enum default_RGBColor {
    Green(UInt8)
}

func def_parameter_enum(enum_para:test_RGBColor,default_para!:test_RGBColor = enum_top){
    // enum类型作为方法入参及形参默认值
    return default_para
}

func defparameterenum(enum_para:default_RGBColor,default_para!:test_RGBColor = enum_top){
    // enum类型作为方法入参及形参默认值
    return enum_para
}

public class Cla_1 <: Hashable & Equatable<Cla_1> {
    public var x:Int64
    public Cla_1(x:Int64){
        this.x = x
    }
    public func hashCode() : Int64 {
        return Int64(x)
    }
    public operator func ==(right : Cla_1) : Bool {
        return this.x == right.x
    }
    public operator func !=(right : Cla_1) : Bool {
        return false
    }
}

public class Cla{
    public init(){}
    let tuple_I:(Int8,Int16,Int32,Int64) = (-8,16,-32,64)
    let tuple_UI:(UInt8,UInt16,UInt32,UInt64) = (8,165,3206,64521)
    let tuple_F:(Float32,Float64) = (32.32,64.64)
    let tuple_O:(Bool,Rune) = (true,r'C')

    public func fun_cla1(): Int32{
    let v1 = this.tuple_I[2]
    return v1
    }
}

public struct Struct_1 <: Hashable & Equatable<Struct_1> {
    public var x:Int64
    public init(x:Int64){
        this.x = x
    }
    public func hashCode() : Int64 {
        return Int64(x)
    }
    public operator func ==(right : Struct_1) : Bool {
        return this.x == right.x
    }
    public operator func !=(right : Struct_1) : Bool {
        return false
    }

    public var m_struct1:Int32 = 32

    private  let tuple_Struct2:(Int8,Float16,UInt32) = (12,16.1616,96)
    public var arrayInt32 : Array<Int32> = [8,-10,-2]
    public var multiArr_1 : Array<Array<Int32>> = [arrayInt32,arrayInt32]
    public var multiArr_2 : Array<Array<String>> = [["chou","T塔"],["come one *%$#","go GO Go"]]
    public var map_Struct1 : HashMap<Int32, UInt32> = HashMap<Int32, UInt32>([(-329,1750), (-910,1732),(-76,1675)])
    public var m_struct2:Float32 = 0.2358

    //默认形参，返回元组
    public func fun_struct1(p1: Float32,p2!:(Float32,Range<Int64>,String) = tuple_top1) :(Float32,Range<Int64>,String){
        var v1:String = "10..0:1 => 磨人的小妖精"
        var v2:Range<Int64> = 10..-2:-1
        var res :(Float32,Range<Int64>,String) = (p1,v2,p2[2] + v1)
        return res
    }
    //默认形参，返回一维数组
    public func fun_struct2(p1: Int64,p2!:Array<Int64> =[641,642,2574,644]) :Array<Int64>{
       p2[0] = 2022711 % p1
       var res: Array<Int64> = [p2[0],p1,126]
       return res
    }
    //默认形参，返回多维数组
    public func fun_struct3(p1: Int64,p2!:Array<Array<Int64>> = [Struct_1(231).fun_struct2(-59)]) :Array<Array<Array<Int64>>>{
       p2[0][0] = 202358 % p1
       var res :Array<Array<Array<Int64>>> = [p2,p2]
       return res
    }
}

public enum Enum_1 <: Hashable & Equatable<Enum_1> {
    | Year
    | Week(Int32)

    public func hashCode() : Int64 {
        return Int64(64)
    }
    public operator func ==(right : Enum_1) : Bool {
        return true
    }
    public operator func !=(right : Enum_1) : Bool {
        return false
    }

    public func fun_E1(p1: Float32,p2:(Int32,HashSet<Range<Int64>>,Array<Unit>),p3!:HashMap<Int16, UInt16> = HashMap<Int16, UInt16>([(16,51),(12,91)])) :(Float32,HashSet<Range<Int64>>,HashMap<Int16, UInt16>){
        var res :(Float32,HashSet<Range<Int64>>,HashMap<Int16, UInt16>) = (p1,p2[1],p3)
        return res
    }

    //非命名形参，返回一维数组
    public func fun_E2(p1: Int64,p2:Array<Int64>) :Array<Int64>{
       p2[0] = 2022711 - p1
       var res:Array<Int64> = p2
       return res
    }
    //非命名形参，返回多维数组
    public func fun_E3(p1: Int64,p2:Array<Array<Array<Int64>>>) :Array<Array<Array<Array<Int64>>>>{
       p2[0][0][0] = 20711 >> p1
       p2.reverse()
       var res :Array<Array<Array<Array<Int64>>>> = [p2,p2]
       return res
    }
    //非命名形参，返回HashSet
    public func fun_E4(p1:HashSet<Float32>) :HashSet<Float32>{
       p1.reserve(3)
       var res :HashSet<Float32> = p1
       return res
    }
    //非命名形参，返回HashMap
    public func fun_E5(p1:HashMap<Int16, HashSet<String>>) :HashMap<Int16, HashSet<String>>{
       p1.reserve(-2)
       var res :HashMap<Int16, HashSet<String>> = p1
       return res
    }
}


main():Int64{
    /*##>>>>>>>>>>>>>>>>>>>baseType<<<<<<<<<<<<<<<<<<<<<<<<##*/
    let claIns1:Cla = Cla()
    var vm_1:Int8 = claIns1.tuple_I[0] //(Int8):-8
    var vm_2:Int16 = claIns1.tuple_I[1] //(Int16):16
    var vm_3:Int32 = claIns1.tuple_I[2] //(Int32):-32
    let vm_4:Int64 = claIns1.tuple_I[3] //(Int64):64

    let vm_5:UInt8 = claIns1.tuple_UI[0] //(UInt8):8
    var vm_6:UInt16 = claIns1.tuple_UI[1] //(UInt16):165
    var vm_7:UInt32 = claIns1.tuple_UI[2] //(UInt32):3206
    let vm_8:UInt64 = claIns1.tuple_UI[3] //(UInt64):64521

    let vm_9:Float32 = claIns1.tuple_F[0] //(Float32):32.32
    var vm_10:Float64 = claIns1.tuple_F[1] //(Float64):64.64

    var vm_11:Bool = claIns1.tuple_O[0] //(Bool):true
    let vm_12:Rune = claIns1.tuple_O[1] //(Rune):'C'
    var vm_13:Float16 = 1.016 //(Float16):1.016

    /*##>>>>>>>>>>>>>>>>>>>class<<<<<<<<<<<<<<<<<<<<<<<<##*/
    let claIns_1:ClassViaExtend = ClassViaExtend(12,32)
    let claIns_2:ClassViaOverLoad = ClassViaOverLoad(12,32)

    //extend class
    var varCE1 = claIns_1.length //成员变量 (Int32):32
    var varCE2 = claIns_1.fun_f1("Jump yeah!") //实例成员函数含默认值-> (Int64) :74
    var varCE3 = claIns_1.v2 //实例成员属性 (Int64) :2
    var varCE4 = ClassViaExtend.f_001(vm_7) //静态成员函数含默认值  (UInt32) : 9
    var varCE5 = ClassViaExtend.v1 //静态成员属性 (Int64) :1
    var varCE6 = claIns_1.fun_extend_I1(claIns_1) //接口扩展 (Int32):22
    var varCE7 = ClassViaExtend.fun_f2(vm_3) //非泛型静态函数返回class

    //overLoad class
    var varCO1 = claIns_2.f_withoutBody() //空参重载 Unit:()
    var varCO2 = claIns_2.fun_1(vm_3,vm_3<<2) //默认形参 (Int32): -170
    var varCO3 = ClassViaOverLoad.fun_s1(vm_4) //全参重载静态函数 (Int64): 87
    var varCO4 = ClassViaOverLoad.fun_s1(vm_3,pa_2:-32) //默认形参重载静态函数(含两个默认形参) (Int32): -45

    //generices class
    var varCG1 = C1<Float32>(32.32).width //泛型类的成员变量 (Float32):32.3199997
    var varCG2 = C1<Float32>.fun_cs1(vm_9) //泛型类的静态成员函数 (Float32):32.3199997
    var varCG3 = C2<Rune,Float64,UInt32>(r'H',vm_10,vm_7).fun_1() //多泛型类的实例成员函数 Unit:()
    var varCG4 = C2<Bool,UInt16,Int8>(vm_11,vm_6,vm_1).fun_1(vm_11,vm_6,vm_1) //多泛型类的扩展实例成员函数 ->C2<Bool, UInt16, Int8>
    var varCG5 = C1<Float16>.fun_cs1(10.106,0.321) //泛型类函数返回泛型类实例 ->C1<Float16>
    var varCG6 = C1<Float16>.fun_cs3(C1<Float16>.fun_cs2(0.162)) //泛型类函数入参为泛型类实例 (Float16):0.16199

    //inherit class
    let claIns_4:subCla_1 = subCla_1() //->subCla_1
    var varCI1 = claIns_4.length //非泛型父类的成员变量 (Int32): 20
    var varCI2 = claIns_4.f_withoutBody() //非泛型父类的实例成员函数(空函数体) Unit:()
    var varCI3 = ClassViaInherit.fun_s1(vm_3) //非泛型父类的静态成员函数，含默认值 (Int32): -64
    var varCI4 = claIns_4.fun_f1(vm_3) //非泛型子类重写父类的实例成员函数 (Int32):2
    var varCI5 = subCla_1.fun_Is1(a:vm_3) //非泛型子类实现的接口函数，含默认值 (Int32): -256

    let subIns_1 = SubClaViaViaGenerices<Bool,UInt16,Int8>(vm_11,vm_6) //泛型子类实例 -> SubClaViaViaGenerices<Bool, UInt16, Int8>
    var varCI6 = subIns_1.subVar //泛型子类的成员变量 (Bool) : true
    var varCI7 = ClaInsViaGenerices<UInt16,Int32>.fun_s1(vm_3) //泛型父类的静态成员函数  (Int32): -32
    var varCI8 = subIns_1.fun_f1(vm_11) //泛型子类重写父类的实例成员函数 Unit:()
    var varCI9 = SubClaViaViaGenerices<Bool,UInt16,Int8>.fun_Is1(vm_1) //泛型子类实现的接口函数（静态）(Int8): -8

    var varCI10 = claIns_4.fun_I1(vm_13) //非泛型子类实现的接口（当前函数在接口申明时含函数体） (Float16) : 1.0156
    var varCI11 = claIns_4.fun_sub02() //循环中调用函数 Unit:()
    var varCI12 = SubClaViaViaGenerices<Bool,UInt16,Float16>.fun_sub2(vm_11,vm_6) //泛型子类函数返回泛型父类实例 ->ClaInsViaGenerices<Bool, UInt16>
    var varCI13 = subCla_1.fun_sub03(SubClaViaViaGenerices<Bool,UInt16,Int32>.fun_Is1(32)) //非泛型子类函数返回非泛型父类实例 ->ClassViaInherit

    /*##>>>>>>>>>>>>>>>>>>>struct<<<<<<<<<<<<<<<<<<<<<<<<##*/
    let reIns_1:StructViaExtend = StructViaExtend(-32,96)  //-> StructViaExtend
    //extend struct
    var varRE1 = reIns_1.length //成员变量 (Int32): 96
    var varRE2 = reIns_1.fun_r1("Cangjie hahei!") //实例成员函数含默认值,do while 循环 (Int64): 0
    var varRE3 = reIns_1.v2 //实例成员属性 (Int64): -2
    varRE1 = varRE1 + Int32(varRE3)
    varRE3 = -2
    var varRE4 = StructViaExtend.fun_rs1(vm_7) //静态成员函数含默认值 (UInt32): 3207
    var varRE5 = StructViaExtend.v1 //静态成员属性 (Int64): -1
    var varRE6 = reIns_1.fun_extend_I1(reIns_1) //接口扩展，内部级联调用,含循环（for while :continue break）  Unit:()

    //generices struct
    var varRG1 = R1<Float32>(32.32).length //泛型struct的成员变量 (Float32): 32.3199997
    var varRG2 = R1<Float64>.fun_rs1(vm_10) //泛型struct的静态成员函数 (Float64) : 64.640000000000001
    var varRG3 = R2<UInt16,Int64>(vm_6,vm_4).fun_1() //多泛型类的实例成员函数 Unit:()
    var varRG4 = R2<Float32,UInt32>(vm_9,vm_7).fun_1(vm_9,vm_7) //多泛型类的扩展实例成员函数返回为泛型struct实例 R2<Float32, UInt32>
    var varRG5 = R2<Float32,UInt32>(vm_9,vm_7).fun_1(R1<Float32>(32.32),p2:vm_3) //泛型struct的扩展实例成员函数入参为泛型struct实例 R2<Float32, Int32>

    //overLoad struct
    let reIns_2:StructViaOverLoad = StructViaOverLoad()
    var varRO1 = reIns_2.fun_withoutBody(vm_3) //空函数体 Unit:()
    var varRO2 = reIns_2.fun_r1(vm_3,para_2:vm_3<<2) //全参重载实例成员函数 (Int32) :-157
    var varRO3 = StructViaOverLoad.fun_rs1(vm_3,pa_2:52) //默认形参重载静态函数(含两个默认形参) (Int32) :83

    /*##>>>>>>>>>>>>>>>>>>>enum<<<<<<<<<<<<<<<<<<<<<<<<##*/
    let  enumIns_1 = TimeUnit1.Year(vm_3)
    var varE1 = enumIns_1.fun_E1(TimeUnit1.Year) //返回(Int32): 0
    var varE2 = enumIns_1.fun_E1(vm_3) //重载函数返回TimeUnit1
    var varE3 = TimeUnit1.fun_s1(vm_3) //静态成员函数扩展 (Int32): -32
    varE2 = enumIns_1
    let  enumIns_2 = TimeUnit2<UInt16,Int64>.Year(vm_6,vm_4) //TimeUnit2<UInt16, Int64>
    var varE4 = enumIns_2.fun_E2(enumIns_2)//泛型enum的实例成员函数 (Int32): 2
    var varE5 = TimeUnit2<UInt16,Int64>.fun_sE1()//泛型enum的静态扩展函数 ->TimeUnit2<Int32, Int32>

    //other
    var varM1 = reIns_2.fun_r1(vm_3,para_2:reIns_2.fun_r1(-32,vm_3)) //函数调用作为另一函数的入参 (Int32):-103
    var varM2 = C1<UInt64>.fun_cs2(vm_8) //泛型静态函数内部级联调用 C1<UInt64>
    var varM3 = v_top_2//top level变量 (Bool): false
    var varM4 = fun_top1()//top level函数 级联调用 Unit:()
    var varM5 = reIns_1.fun_lambda()//lambda表达式应用 不定，数组元素由随机数产生


    /*##>>>>>>>>>>>>>>>>>>> unit <<<<<<<<<<<<<<<<<<<<<<<<##*/
    var unit_001 = ()

    let unit_002 = if (1==1) {()}
    var unit_003 = if (1==1) {}

    let intRange = 0..5
    let unit_004 = for(number in intRange) { print("${number}") }

    var number = 2
    var unit_005 = while(number>0) { number-- }
    let unit_006 = do { number++ } while (number<5)

    var unit_007 = returnUnit()

    let unit_008 = addSelf()
    var unit_009 = subSelf()

    let unit_010 = assign()

    var unit_011 = { a:Int64 => print("${a}") }(1)
    let unit_012 = { => }()

    var unit_013 = funcUnit()
    let unit_014 = def_parameter_unit()
    var unit_015 = def_parameter_unit(default_para:funcUnit())
    var unit_016 = parameterUnit(())

    let string_001 = ""
    var string_002 = "hello cangjie"
    let string_003 = "\"hello cangjie\""
    var string_004 = "hello cangjie\n"
    let string_005 = "仓颉语言中文字符串测试"
    var string_006 = "`~!@#$%^&*()_+-=[{}]\\|:;'\",./?"
    let string_007 = "~·！@#￥%……&*（）——+-={}【】、|：；‘“”“，。、？"
    var string_008 = "1"
    let string_009 = "1q2w·~！&^\"p仓颉测试]】。-)）？、\n"
    var string_010 = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567891234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567891234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567891234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567891234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567891234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567891234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567891234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567891234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567891234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567891234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567891234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567891234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    let string_011 = """
"""
    var string_012 = """
    hello 仓颉调试插件测试，
    ？【】……%￥#@！()-=\nk.,.。、·……
    \"、、|.。
    `~!@#$%^&*()_+-=[{}]\\|:;'\",./?
    ~·！@#￥%……&*（）——+-={}【】、|：；‘“”“，。、？"""

    let string_013 = #""#
    var string_014 = ##"\0\\\b\f\n\r\t\v\'\"\u{1}"##
    let string_015 = ###"hello 仓颉调试插件测试，
    ？【】……%￥#@！()-=\nk.,.。、·……
    \"、、|.。
    `~!@#$%^&*()_+-=[{}]\\|:;'\",./?
    ~·！@#￥%……&*（）——+-={}【】、|：；‘“”“，。、？"###

    var test_string = "您好，cangjie"
    var string_016 = "The string is ${test_string}"
    var r = 2.4
    let string_017 = "The area is ${let PI=3.14; PI*r*r}"

    var string_018 = returnString()
    let string_019 = inputString("仓颉$test")
    var string_020 = def_parameter_string("使用默认形参")
    var string_021 = defparameterstring("第一个参数",default_para:"给默认形参赋值")

    var enum_001 = test_RGBColor.Red
    let enum_002 = test_RGBColor.Red(100)
    let enum_002_2 = test_RGBColor.Red(120)

    let enum_003 = Blue
    var enum_004 = test_RGBColor.Green(10)  // test_RGBColor
    let enum_005 = Yellow
    var enum_006 = Yellow(10,20,30,40,1.0,2.0,3.0,true,r'C',"你好，cangjie。")

    let enum_007 = test_TimeUnit1<String>.Year("你好，cangjie。")
    var enum_008 = ten_enum<test_TimeUnit1<String>, Int8, Int8, Int16, Int16, Int32, Int32, Int64, String, Unit>(enum_007, 2, 3, 4, 5, 6, 7, 8, "你好，cangjie。", ())

    let enum_009 = Green(20) // default_RGBColor
    var enum_010 = enumInFunc()
    let enum_011 = def_parameter_enum(enum_003)
    var enum_012 = defparameterenum(enum_009, default_para:enum_006)

    let class_001 = test_C1()
    let class_002 = test_C2<Unit>(())
    var class_003 = test_C3("调试插件测试", class_002)
    let class_004 = test_C4<Bool,String>(1, true, v:2, z:"你好，cangjie。")
    let class_r1 = test_R1()
    var class_005 = test_C5<test_C1, test_RGBColor, String, test_R1, Unit, Bool, Rune, Int64, Float64, UInt8>(class_001, enum_001, "你好，cangjie。", class_r1, (), true, r'*', 8, 9.0, 10)
    
    let struct_001 = test_R1()
    var struct_002 = test_R2(1, true, v:2, z:"abcde")
    let struct_003 = test_R3<test_R2>(struct_002)
    var struct_004 = test_R4<Int32,Int64>(10, 30)
     
    let struct_ins_1 = Struct_1(32)
    let enum_ins_1 = Enum_1.Week(23)
     
    var vm_01:Int8 = 18
    var vm_Tuple12 = struct_ins_1.fun_struct1(32.215)  //默认形参，返回元组
      
    return 0
}
