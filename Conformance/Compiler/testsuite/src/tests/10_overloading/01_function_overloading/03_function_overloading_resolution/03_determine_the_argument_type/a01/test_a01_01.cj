/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_03_a01_01

  @Level:         1

  @Assertion:   10.1.3.3(1)
                Determine the Argument Type one of the types 
                of the parameter can pass the type check in 
                the type check phase, it is considered that the parameter can
                pass the type check of the candidate function.
  
  @Description:  Overloading with arrow (functional/procedural) type
                 Compiler successfully solves overloading in functions fv
                 
  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

let f64: Float64 =  64.0f64 

open class Klass  {

    public static func fv(f:(Float64)->Float64,arg:Float64) {
        Assert.equals(f64, -arg)
   }

}

func neg(arg:Float64) {
    -arg
}
func same(arg:Float64) {
    arg
}




main(ina :Array<String>) {
    Klass.fv(neg,-f64)
    Klass.fv(same,-f64)
    0
}



