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

import com.example.myapplication.Main;

@RunWith(AndroidJUnit4.class)
public class MainInstrumentedTest {
  @Test
  public void test00() {
    Main.main(new String[] {});
    final StringBuilder sb = new StringBuilder();
    sb.append("CangjieClass.init p[0] = true, p[1] = 1\n");
    sb.append("CangjieClass.instanceMemberFunction p[0] = true, p[1] = 1\n");
    sb.append("p[0] = true, p[1] = 1\n");
    sb.append("CangjieClass.staticMemberFunction p[0] = true, p[1] = 1\n");

    sb.append("CangjieStruct.init p[0] = true, p[1] = 1\n");
    sb.append("CangjieStruct.instanceMemberFunction p[0] = true, p[1] = 1\n");
    sb.append("p[0] = true, p[1] = 1\n");
    sb.append("CangjieStruct.staticMemberFunction p[0] = true, p[1] = 1\n");

    sb.append("CangjieEnum.instanceMemberFunction p[0] = true, p[1] = 1\n");
    sb.append("p[0] = true, p[1] = 1\n");
    sb.append("CangjieEnum.staticMemberFunction p[0] = true, p[1] = 1\n");

    sb.append("JavaClassImplCangjieInterface.JavaClassImplCangjieInterface\n");
    sb.append("JavaClassImplCangjieInterface.instanceMemberFunctionWithoutDefaultImpl\n");
    sb.append("JavaClassImplCangjieInterface.staticMemberFunctionWithoutDefaultImpl\n");
    sb.append("result = true\n");
    assertEquals(Logger.getLog(), sb.toString());
  }
}
