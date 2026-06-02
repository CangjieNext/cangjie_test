/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a15_09_neg

  @Level:         1

  @Assertion:    10.1.2.1(15) If present in a type definition, the visible function
                 set contains only non-static member methods f in the current type 
                 (including inherited but not extended);
  
  
  @Description:  Compiler emits error on keyword 'punlic' instead 'public'

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/



enum ENUM {
    i8 | i16 | i32 | i64 | u8| u16| u32| u64| f16| f32| f64
    
    private static func enuco(enu:ENUM): Int8 {
        let  this_value = match(enu) {
            case i8 => 0i8
            case i16 => 1i8
            case i32 => 2i8
            case i64 => 3i8
            case u8 =>  4i8
            case u16 => 5i8
            case u32 => 6i8
            case u64 => 7i8
            case f16 => 9i8
            case f32 => 10i8
            case f64 => 11i8
        }
        return this_value;
   }

    punlic operator func == (Right:ENUM):Bool {
        this == enuco(Right)
    }


    
}

type Klass = ENUM

main(ina :Array<String>) {
    
    0
}



