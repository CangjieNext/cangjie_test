/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import static org.junit.Assert.*;

import androidx.test.ext.junit.runners.AndroidJUnit4;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(AndroidJUnit4.class)
public class MainInstrumentedTest {
  @Test
  public void test00() {
    Main.main(new String[] {});
    StringBuilder sb = new StringBuilder();
    sb.append("run java Main\n");
    sb.append("in JavaClass Init\n");
    sb.append("in CangjieInvoke Init\n");
    sb.append("in JavaClass Init\n");
    sb.append("in JavaClass foo\n");
    sb.append("in JavaClass Init\n");
    sb.append("in JavaClass goo\n");
    sb.append("JavaClass inherit goo: 10\n");
    sb.append("in I1 bar\n");
    sb.append("I1 bar: 1\n");
    sb.append("in I2 bar\n");
    sb.append("I1 bar: 2\n");
    sb.append("in JavaClass bar\n");
    sb.append("JavaClass inherit bar: 100\n");
    sb.append("in JavaClass new goo\n");
    sb.append("JavaClass new goo: 1000\n");
    sb.append("in JavaClass new bar\n");
    sb.append("JavaClass new bar: 666\n");
    assertEquals(Logger.getLog(), sb.toString());
  }
}
