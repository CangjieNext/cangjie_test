/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description: Aux file with module 'mod_05_01_01_01_a01_1'

  @Module:      mod_05_01_01_01_a01_1

  @Structure:   complex-aux

*/

package pkg1

public func myPublicFunc1(): String {
  return "func myInternalFunc1 can be accessed in own package with result : " + myInternalFunc1("aux_module_1")
}
func myInternalFunc1(inVal: String) {
  "${inVal} from my myInternalFunc1"
} 
