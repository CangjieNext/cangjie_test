/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


package pkgs

public enum TimeUnit {
    | Year|Year(Int32)
    | Month(Int32, Int64)
    public func f1(par_1:Int32):Int32 {
        var var_m1 =par_1
        let var_m2 =par_1
        return var_m1
    }
}

public enum TimeUnit_1<X> {
    Year|Month|Day
    public func f1(par_1:X):X {
            var var_m1 =par_1
            let var_m2 =par_1
            return var_m1
        }

        public static func fun_s1(par_1:X):X {
            var var_s1 =par_1
            return var_s1
        }
}

public struct Rectangle_ex {
    public var width: Int32 = 10
    public var length: Int32 = 20
    public static var vc_1: Int32 = 79
    public static let vc_2: Int32 = 3    //静态成员变量
    private static var var_pri :Int32 =21
    public init (width: Int32, length: Int32) {
        this.width = width
        this.length = length
    }
    public static func f_static() : Int32{
        var vf_1: Int32 = vc_1 +vc_2
        return  vf_1
    }
    public func area() : Int32{
        var vf_1: Int32 = width * length
        return  vf_1
    }
}


public class Exter_C1 {
    // 成员变量
    public var width: Int32 = 10
    public var length: Int32 = 20
    public static var vc_1: Int32 = 79
    public static let vc_2: Int32 = 3    //静态成员变量
    private static var var_pri :Int32 =21
    public var year: TimeUnit = TimeUnit.Year(19)
    public var month: TimeUnit_1<Int32> = TimeUnit_1<Int32>.Month
    public var rectangle_Ins: Rectangle_ex = Rectangle_ex(100, 100)  //构造Rectangle_ex的实例对象
    public var c_area: Int32 = rectangle_Ins.area()
    public init (width: Int32, length: Int32) {
        this.width = width
        this.length = length
    }
    public static func f_static(): Int32 {
        var vf_1: Int32 = vc_1 +vc_2
        return  vf_1
    }
    public func area(): Int32 {
        var vf_1: Int32 = width * length
       return  vf_1
    }
}

public var top_var_1: Int32 =Rectangle_ex(100, 100).length
public let top_var_2: Int32 = Exter_C1.vc_1

public struct R1<T> {
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

public class C1<T> {
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
       public static func fun_cs1(par_1:T):T{
        var par_fs1 = R1<Float16>(10.12).width
        let par_return = par_1
        return par_return
        }
}

