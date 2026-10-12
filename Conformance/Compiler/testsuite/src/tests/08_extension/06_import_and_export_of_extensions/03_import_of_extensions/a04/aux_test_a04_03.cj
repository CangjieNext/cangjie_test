/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:     Defines a package pkg3 for example.

  @Dependencies:    aux_test_a04_01.cj

  @Structure:       complex-aux
*/

package pkg3

import pkg1.AuxTestA0401

public interface AuxTestA0403 {
    func f(): Unit {}
}

extend AuxTestA0401 <: AuxTestA0403 {} // ok, external
