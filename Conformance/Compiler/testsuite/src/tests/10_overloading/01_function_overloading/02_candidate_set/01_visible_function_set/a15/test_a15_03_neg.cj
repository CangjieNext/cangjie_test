/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a15_03_neg

  @Level:         1

  @Assertion:    10.1.2.1(15) If present in a type definition, the visible function
                 set contains only non-static member methods f in the current type 
                 (including inherited but not extended);
  
  
  @Description:  Overloading via type definition. 
                 Compiler emits error. As static methods are unreachable
                 via object

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/


class Klass0 {    
    public static func SCheck(arg:Int8) {
    }
}

type Klass = Klass0;


main(ina :Array<String>) {

  var kl: Klass = Klass();
    kl.SCheck(i8)
    0
}



