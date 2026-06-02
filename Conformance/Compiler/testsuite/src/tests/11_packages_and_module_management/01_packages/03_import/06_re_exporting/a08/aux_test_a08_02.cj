/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Structure:    complex-main
  @Dependencies: aux_test_a08_01.cj
*/

package pkg2 
import pkg1.AuxTestA0801            // class AuxTestA0801 of pkg1 must be re-exported. 
public func f() { 
    let c = AuxTestA0801() 
    return c 
} 