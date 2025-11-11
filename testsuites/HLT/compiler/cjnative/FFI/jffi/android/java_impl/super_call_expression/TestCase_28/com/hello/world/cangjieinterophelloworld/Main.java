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
            (byte) 1,
            new byte[114514],
            new double[114514],
            new char[114514],
            new byte[114514],
            114.514000D,
            1L,
            new float[114514],
            1L,
            new byte[114514]);
    Logger.println("hello");
  }
}
