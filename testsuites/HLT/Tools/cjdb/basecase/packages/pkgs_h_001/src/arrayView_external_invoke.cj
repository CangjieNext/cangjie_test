/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




import pkgs.*

   var arrayUInt64 : Array<UInt64> = [41, 42, 43, 44, 45, 46, 47, 48]
   var arrayUInt64_d : Array<Array<UInt64>> = [arrayUInt64,arrayUInt64]
main() {
       var newc = Exter_C1(100, 200)
       var main_Rect = Rectangle_ex(10,12)

       var val_1 :Array<Array<Int32>> =newc.arrayInt32_d //Exter_C1的Array<Array<Int32>>
       var arr_1:Array<Int32> = [val_1[0][0],-20,val_1[0][2]]
       var arr_2:Array<Int32>= [val_1[1][0],-20,val_1[1][2]]
       var val_2 =newc.fun_001(val_1,[arr_1,val_1[1]])  // Array<Array<Array<Int32>>>
       var val_3 = main_Rect.arrayInt32_d  //Rectangle_ex的Array<Array<Int32>>
   //  var val_4 = main_Rect.fun_1(Array<Array<Int32>>([arr_2,val_1[1]]))  // exception

       var val_6 :Array<Array<UInt64>> = arrayUInt64_d //跨包_主调 ：top_level
       var val_7 :Array<Array<Array<Int64>>>= arrayInt64_t //跨包_被调 ：top_level



    return 0
}

