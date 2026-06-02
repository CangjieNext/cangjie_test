/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_02_a01_dec_exp_1

  @Level:         1

  @Assertion:    1.3.2(1) 
                 Floating-point literals can be written in 2 bases:
                 decimal (without prefix) and hexadecimal (prefixed with 0xor 0X).

                  
  @Description:  Check that float number with decimal exponent folded correctly
                 Considered all float types f16,f32,f64, default(f32)

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert
main() {
    Assert.equals(2e4,20000.0)
    Assert.equals(2e4f32,20000.0f32)
    Assert.equals(2e4f16,20000.0f16)
    Assert.equals(2e4f64,20000.0f64)
    
    Assert.equals(1e-2,0.01)
    Assert.equals(1e-2f16,0.01f16)
    Assert.equals(1e-2f32,0.01f32)
    Assert.equals(1e-2f64,0.01f64)
    
    Assert.equals(.8e1f16,8.0f16)
    Assert.equals(.8e1,8.0f32)
    Assert.equals(.8e1f64,8.0f64)
}
