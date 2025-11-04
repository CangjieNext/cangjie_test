/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.hello.world.cangjieinterophelloworld.Logger;

class SuperClass {
  public byte aByte = 1;
  public static short aShort = 1;

  public SuperClass(byte aByte) {
    this.aByte = aByte;
  }

  public void foo() {
    Logger.println("Java-SuperClass-foo");
  }

  public static void goo() {
    Logger.println("Java-SuperClass-goo");
  }
}

public class Inherit extends SuperClass {
  public Inherit(byte aByte) {
    super(aByte);
  }

  @Override
  public void foo() {
    Logger.println("Java-Inherit-foo");
  }

  public static void goo() {
    Logger.println("Java-Inherit-goo");
  }
}
