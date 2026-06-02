/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_08_a03_02

  @Level:         1

  @Assertion: 4.8(3)
              The syntax of numeric type conversion expressions are defined as:

              numericTypeConvExpr
                  : numericTypes '(' expression ')'
                  ;

              numericTypes
                  : 'Int8'
                  | 'Int16'
                  | 'Int32'
                  | 'Int64'
                  | 'UInt8'
                  | 'UInt16'
                  | 'UInt32'
                  | 'UInt64'
                  | 'Float16'
                  | 'Float32'
                  | 'Float64'
                  ;

  @Description: Check that numeric type conversion expression without '(' causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    let x = Int64 5)
}

