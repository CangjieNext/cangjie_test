/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




var var_top1 : Int32 = 12
main()  {
    var v_main_1: Int32 = f_001(2, b: 2) //命名形参
    var v_main_2: Int32 = f_001(2) //可选形参b,默认b=1
    var v_main_3: Int32 = Exter_C1.area()
    var v_main_4: Int32 = Exter_C1.vc_2
        v_main_3 +=1
    var v_main_5: Int32 = Rectangle_ex.area()
        v_main_4 +=1
    var v_main_6: Int32 = Rectangle_ex.vr_1
        v_main_5 +=1
    var v_main_7: Int32 = Exter_C1(12,para2:2).width
        v_main_6 +=1
    var v_main_8: Int32 = Rectangle_ex(12,10,para2:2).var_m1
        v_main_7 = -9
        v_main_8 = f_002()
   return 1
}

  func f_001(a: Int32, b!: Int32 = 1): Int32 {
    var a1: Int32  = a
    var b1: Int32 = b
    a1 = -5
    b1 = b + 3
    return a1 + b1
}

  func f_002(){
    var vf_1: Int32 = Exter_C1.vc_1 // 79
        for (i in 0..3) {
            vf_1 += Int32(i)
        }
    return vf_1
}

class Exter_C1 {
    // 成员变量
    public var width: Int32 = 10
    public static var length: Int32 = 20
    public static var vc_1: Int32 = 79
    public static let vc_2: Int32 = 3    //静态成员变量
    private static var var_pri :Int32 =21  //本类私有成员变量
    //主构造函数
    public Exter_C1(width: Int32, var para2!: Int32=10){
          this.width =width
    }
     public static func area(): Int32 {
         var vc_f1: Int32 = -80
         var vc_f2: UInt32 = 80
         vc_f1 = -123
        return  length + var_pri
    }
}

  struct Rectangle_ex{
     public var width: Int32 = 10
        public var var_m1: Int32
        public static let vr_1: Int32 = 79
        public static var length: Int32 = 20
        private static var var_pri :Int32 =21
        //主构造函数
        public Rectangle_ex(width: Int32,var_m1:Int32,public var para2!: Int32=10){
            this.width =width
            this.var_m1 =var_m1
        }
        public static  func area(): Int32 {
            return length + var_pri
        }
}


