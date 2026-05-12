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
    sb.append("orginal-1 size aInt: 21475\n");
    sb.append("orginal-1 size arrLong: 21475\n");
    sb.append("changed-1 value arrLong: 0, 21474\n");
    sb.append("changed-1 size aInt: 21475\n");
    sb.append("changed-1 value aInt: 0, 21474\n");
    sb.append("changed-2 size arrLong: 0\n");
    assertEquals(Logger.getLog(), sb.toString());
  }
}
