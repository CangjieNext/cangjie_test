/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.example.myapplication.Logger;

import java.lang.ref.Cleaner;
import java.util.concurrent.atomic.AtomicInteger;;

class SuperClass {
  public long aByte = 1;
  public static short aShort = 1;

  public SuperClass(long aByte) {
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
  public Inherit(long aByte) {
    super(aByte);
  }

  @Override
  public void foo() {
    Logger.println("Java-Inherit-foo");
  }

  public static void goo() {
    Logger.println("Java-Inherit-goo");
  }
  protected void javaProtectedFunc() {
    Logger.println("Inherit.javaProtectedFunc");
  }
}
