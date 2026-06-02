/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: public interface I {} // can be accessed outside the package
              interface I2 {} // can only be accessed inside the package

  @Description: Interfaces from the example

  @Structure: complex-aux
*/

package a03

public interface A03Aux {} // can be accessed outside the package
interface I2 {} // can only be accessed inside the package