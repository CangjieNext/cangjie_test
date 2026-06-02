/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

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
    sb.append("in CangjieInvoke Init\n");
    sb.append("in C1 init12\n");
    sb.append("in JavaClass Init12\n");
    sb.append("in C1 goo\n");
    sb.append("JavaClass goo: 1\n");
    sb.append("in JavaClass bar\n");
    sb.append("JavaClass bar: 102\n");
    sb.append("in C1 bar\n");
    sb.append("C1 bar: 2\n");
    sb.append("in JavaClass new newoo\n");
    sb.append("JavaClass newoo: 10001\n");
    sb.append("javaClass.v1: 1\n");
    sb.append("JavaClass.v2: 2\n");
    assertEquals(Logger.getLog(), sb.toString());
  }
}
