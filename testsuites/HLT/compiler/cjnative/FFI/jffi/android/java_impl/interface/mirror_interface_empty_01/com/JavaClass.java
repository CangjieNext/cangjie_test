/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.hello.world.cangjieinterophelloworld.Logger;

interface I1 {}

public class JavaClass implements I1 {
  public JavaClass() {
    Logger.println("in JavaClass Init");
  }

  public boolean test() {
    Logger.println("in JavaClass Func");
    return true;
  }
}
