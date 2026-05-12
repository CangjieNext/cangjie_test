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
    sb.append("original-1 instance aInt[9]: 18\n");
    sb.append("original-2 instance aInt[9]: 18\n");
    sb.append("changed-1 instance aInt[9]: 90\n");
    sb.append("original-1 static arrayInt[9]: 9\n");
    sb.append("original-2 static arrayInt[9]: 9\n");
    sb.append("changed-1 instance aInt[9]: 90\n");
    assertEquals(Logger.getLog(), sb.toString());
  }
}
