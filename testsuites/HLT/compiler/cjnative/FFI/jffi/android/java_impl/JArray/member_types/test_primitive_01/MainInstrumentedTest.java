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
    sb.append("run java\n");
    sb.append(
        "instance member of JavaClass are: false, 127, 32767, 97, 2147483647, 9223372036854775807,"
            + " 0.000000, 0.000000\n");
    sb.append(
        "instance member of JavaClass are: false, 127, 32767, 97, 2147483647, 9223372036854775807,"
            + " 3.141593, 3.141593\n");
    assertEquals(Logger.getLog(), sb.toString());
  }
}
