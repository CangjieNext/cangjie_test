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
            1L,
            new short[114514],
            new long[114514],
            new long[114514],
            (byte) 1,
            "hello",
            (byte) 1,
            (short) 1,
            114.514000D);
    Logger.println("hello");
  }
}
