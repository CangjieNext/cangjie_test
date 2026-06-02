/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:  Aux file with some macros for testing

  @Structure:    complex-aux

  @Dependencies: a.cj
*/
    
// b.cj
package b_01
public import a.*               // error: macro packages can only be
                                // `public import` in macro packages
public func F1(input: Int64) : Int64 {
      return input
}
