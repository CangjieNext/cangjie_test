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
    sb.append("run java\n");
    sb.append("java: JavaClass()\n");
    sb.append("cangjie: CangjieInvoke()\n");
    sb.append("cangjie: 5th of F64 array - 1.000330\n");
    sb.append("cangjie: 2nd of F64 array - -9.554000\n");
    sb.append("cangjie: length of F64 array - 5\n");
    sb.append("java: JavaClass()\n");
    sb.append("cangjie: 2nd of JavaClass array - 55312\n");
    sb.append("cangjie: length of JavaClass array - 9\n");
    sb.append("cangjie: 1st of I64 array - 6\n");
    sb.append("cangjie: 2nd of I64 array - 7\n");
    sb.append("cangjie: 3rd of I64 array - 13\n");
    sb.append("java: 0th of long[] - 6\n");
    sb.append("java: 1th of long[] - 7\n");
    sb.append("java: 2th of long[] - 73\n");
    sb.append("java: JavaClass()\n");
    sb.append("java: JavaClass()\n");
    sb.append("java: JavaClass()\n");
    sb.append("cangjie: 1st of JavaClass array from Java - 55312\n");
    sb.append("cangjie: 2nd of JavaClass array from Java - 55312\n");
    sb.append("cangjie: 3rd of JavaClass array from Java - 55312\n");
    sb.append("java: JavaClass()\n");
    sb.append("java: 0th of JavaClass[] - 55312\n");
    sb.append("java: 1th of JavaClass[] - 55312\n");
    sb.append("java: 2th of JavaClass[] - 55312\n");
    sb.append("cangjie: length of I64 array - 44\n");
    assertEquals(Logger.getLog(), sb.toString());
  }
}
