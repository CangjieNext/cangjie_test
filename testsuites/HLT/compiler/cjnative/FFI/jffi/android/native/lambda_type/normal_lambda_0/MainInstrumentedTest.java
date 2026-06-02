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
    final StringBuilder sb = new StringBuilder();
    sb.append("p0 = \n");
    sb.append("CangjieClass.init, result = ()\n");
    sb.append("p0 = \n");
    sb.append("CangjieClass.instanceMemberFunction, result = 64\n");
    sb.append("result1 = A\n");
    sb.append("p0 = \n");
    sb.append("CangjieClass.staticMemberFunction, result = 32.000000\n");
    sb.append("result2 = 8.0\n");
    sb.append("p0 = \n");
    sb.append("CangjieStruct.init, result = ()\n");
    sb.append("p0 = \n");
    sb.append("CangjieStruct.instanceMemberFunction, result = 64\n");
    sb.append("result1 = A\n");
    sb.append("p0 = \n");
    sb.append("CangjieStruct.staticMemberFunction, result = 32.000000\n");
    sb.append("result2 = 8.0\n");
    sb.append("p0 = \n");
    sb.append("CangjieEnum.instanceMemberFunction, result = 64\n");
    sb.append("result1 = A\n");
    sb.append("p0 = \n");
    sb.append("CangjieStruct.staticMemberFunction, result = 32.000000\n");
    sb.append("result2 = 8.0\n");
    sb.append("result = true\n");
    assertEquals(Logger.getLog(), sb.toString());
  }
}
