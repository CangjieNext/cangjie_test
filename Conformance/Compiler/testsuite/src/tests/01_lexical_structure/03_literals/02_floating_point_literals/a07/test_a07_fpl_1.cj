/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_02_a07_fpl_1

  @Level:         1

  @Assertion:    1.3.2(7) 
                 The suffixes in FloatLiteralSuffix and their corresponding types are

  @Description:  Check float numbers with type suffix has needed type

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

*/
import utils.assert.Assert
main() {
    Assert.isTrue(2.0f32 is Float32) 
    Assert.isTrue(2.0f16 is Float16) 
    Assert.isTrue(2.0f64 is Float64) 
    
    
    Assert.isTrue(.002f32 is Float32) 
    Assert.isTrue(.003f16 is Float16) 
    Assert.isTrue(.004f64 is Float64) 
    
    
    Assert.isTrue(2.002e4f32 is Float32) 
    Assert.isTrue(2.003E4f16 is Float16) 
    Assert.isTrue(2.004e4f64 is Float64) 
    
    Assert.isTrue(2.002e-4f32 is Float32) 
    Assert.isTrue(2.003E-4f16 is Float16) 
    Assert.isTrue(2.004e-4f64 is Float64) 
}
