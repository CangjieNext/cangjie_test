/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




var var_top1 : Int32 = 12
main() : Int32 {
    var v_main_1: Int32 = f_001(2, b: 2) //命名形参
    var v_main_2: Int32 = f_001(2) //可选形参b,默认b=1
    var v_main_3: Int32 = Exter_C1(12,20).area()
    var v_main_4: Int32 = Rectangle_ex(12,20).area()
    return 1
}

//方法含参数默认值 b =1
func f_001(a: Int32, b!: Int32 = 1): Int32 {
    var a1: Int32  = a
    var b1: Int32 = b
    a1 = -5
    b1 = b + 3
    return a1 + b1
}

 class Exter_C1 {
    // 成员变量
    public var width: Int32 = 10
    public var length: Int32 = 20
    public var vc_1: Int32 = 79
    public static let counter: Int32 = 3    //静态成员变量
    private var var_pri :Int16 =21  //本类私有成员变量

init (width: Int32, length: Int32) {
        this.width = width
        this.length = length
    }
    // 成员函数
     public func area(): Int32 {
         vc_1 = 12
         var vc_f1: Int32 = -80
         var vc_f2: UInt32 = 80
         vc_f1 = -123
        return width * length + Int32(var_pri)
    }
}

 struct Rectangle_ex {
    // 成员变量
    public var width: Int32 = 10
    public var vr_1: Int32 = 79
    public var length: Int32 = 20

    // 构造函数
    public init (width: Int32, length: Int32) {
        this.width = width
        this.length = length
    }
    // 成员函数
    public func area(): Int32 {
        return width * length
    }
}





