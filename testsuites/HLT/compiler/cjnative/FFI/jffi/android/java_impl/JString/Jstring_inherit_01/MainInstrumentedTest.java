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
    sb.append("in JavaClass_Child Init\n");
    sb.append("in CangjieInvoke Init\n");
    sb.append("66666\n");
    sb.append("in JavaClass_Child subfoo\n");
    sb.append("111\n");
    sb.append("1\n");
    sb.append("100\n");
    sb.append("88888\n");
    sb.append("2\n");
    sb.append("200\n");
    sb.append("in JavaClass Init\n");
    sb.append("in JavaClass_Child Init\n");
    sb.append("in JavaClass_Child foo\n");
    sb.append("666\n");
    sb.append("in JavaClass_Child subfoo\n");
    sb.append("111\n");
    sb.append("1\n");
    sb.append("100\n");
    sb.append("in JavaClass_Child goo\n");
    sb.append("888\n");
    sb.append("2\n");
    sb.append("200\n");
    assertEquals(Logger.getLog(), sb.toString());
  }
}
