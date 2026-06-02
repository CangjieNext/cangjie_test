/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description: Aux file with module 'mod_05_01_01_01_a01'

  @Module:      mod_05_01_01_01_a01

  @Structure:   complex-aux

*/

package pkg

public func myPublicFunc(): String {
  return "func myInternalFunc can be accessed in own package with result : " + myInternalFunc("aux_module")
}
func myInternalFunc(inVal: String) {
  "${inVal} from my myInternalFunc"
} 
