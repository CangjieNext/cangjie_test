/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: public class C1 {} // can be accessed outside the package
              class C2 {} // can only be accessed inside the package

  @Description: The example code

  @Structure: complex-aux
*/

package a03

public class AuxExample {} // can be accessed outside the package
class C2 {} // can only be accessed inside the package