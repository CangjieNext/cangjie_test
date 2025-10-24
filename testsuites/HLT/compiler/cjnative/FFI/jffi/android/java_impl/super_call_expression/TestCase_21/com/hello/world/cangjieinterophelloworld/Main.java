/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import UNNAMED.ChildClass;

public class Main {
  public static void main(String[] args) {
    final ChildClass childClass =
        new ChildClass(
            new char[114514],
            new float[114514],
            (short) 1,
            new char[114514],
            new short[114514],
            new long[114514],
            new byte[114514],
            new long[114514],
            114.514000F,
            114.514000F);
    Logger.println("hello");
  }
}
