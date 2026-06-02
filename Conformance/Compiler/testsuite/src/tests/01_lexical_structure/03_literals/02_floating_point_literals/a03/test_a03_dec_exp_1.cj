/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_02_a03_dec_exp_1

  @Level:         1

  @Assertion:    1.3.2(3) 
                 An exponential part (prefixed with e or E) is required when there is no decimal part

                  
  @Description:  Any float number can be expressed with exponent w/o fraction part
                 i.e float number can be expressed with integer and exponential part

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert
main() {
    Assert.equals(1e1,10.0)
    Assert.equals(1E-1,0.1)
    
    Assert.equals(8e1f16,80.0f16)
    Assert.equals(8e1,80.0f32)
    Assert.equals(8e1f64,80.0f64)
    
    Assert.equals(8e-2f16,0.08f16)
    Assert.equals(8e-2,0.08f32)
    Assert.equals(8e-2f64,0.08f64)
    // pi number 
    Assert.equals(31415926535e-10,3.1415926535)
}
