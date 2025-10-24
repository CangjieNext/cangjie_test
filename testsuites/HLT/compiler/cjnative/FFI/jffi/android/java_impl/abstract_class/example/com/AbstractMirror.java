/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.hello.world.cangjieinterophelloworld.Logger;

public abstract class AbstractMirror {
  public int instanceField = 1;
  public static int field = 4;

  public static void staticFunc() {
    Logger.println("Java: static func");
  }

  protected abstract void abstractFunc();

  public void instanceFunc() {
    Logger.println("Hello from instance func");
  }
}
