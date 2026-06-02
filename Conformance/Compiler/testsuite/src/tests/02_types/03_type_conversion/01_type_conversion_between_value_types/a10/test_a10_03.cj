/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a10_03

  @Level:         1

  @Assertion:    2.3.1(10) The grammar for type conversion between numeric types is defined as: 
                    numericTypeConvExpr
                    : numericTypes '(' expression ')'
                    ;
                    
                    numericTypes
                    : 'Int8' | 'Int16' | 'Int32' | 'Int64' | 'IntNative' | 'UInt8' | 'UInt16' | 'UInt32' | 'UInt64' |
                      'UIntNative' | 'Float16' | 'Float32' | 'Float64'
                    ;


  @Description:  Check that numericTypes in parentheses causes a compilation error

  @Mode:         compileonly

  @Negative:     yes

*/

main(): Unit {
    var a = (Int32)(8_i8)
}
