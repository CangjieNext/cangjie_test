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
    sb.append("static: 1\n");
    sb.append("java: Hello from MI! [foo(): I]\n");
    sb.append("I.staticMethod(): 1\n");
    sb.append("x is I: true\n");
    sb.append("java: Hello from MI! [foo(I): long]\n");
    sb.append("1\n");
    sb.append("java: Hello from Arg! [g(I): long]\n");
    sb.append("Hello from cj!\n");
    assertEquals(Logger.getLog(), sb.toString());
  }
}
