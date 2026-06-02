/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description: Aux file with module 'mod_05_01_a01'

  @Module:      mod_05_01_a01

  @Structure:   complex-aux

*/

package pkg

public class AuxModule {
  public func myClassFunc() {
    "return from class func"
  }
}
public func myCalcFunc(a:Int64, b:Int64):Int64 {
  return a+b
}
func myLocalFunc(){
  "local function from package mod_05_01_a01"
}