/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.example.myapplication.Logger;

class Father {
  public void foo() {}
}

public class TestModifier02 extends Father {
  public void publicFoo() {}

  protected void protectedFoo() {}

  private void privateFoo() {}

  void internalFoo() {}

  public final void externalFoo() {}

  public static void staticFoo() {}

  public synchronized void synchronizedFoo() {}

  public native void nativeFoo();

  public static native void nativeStaticFoo();

  public void strictfpFoo() {}

  @Override
  public void foo() {
    Logger.println("override foo");
  }
}
