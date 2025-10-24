/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.hello.world.cangjieinterophelloworld.Logger;

public class JavaClass {
  public static int v1 = 1;

  public JavaClass() {
    Logger.println("in JavaClass Init");
  }

  public static int location_return() {
    Logger.println("in JavaClass location_return");
    return 1;
  }

  public static int location_param() {
    Logger.println("in JavaClass location_param:" + v1);
    return 10;
  }
}
