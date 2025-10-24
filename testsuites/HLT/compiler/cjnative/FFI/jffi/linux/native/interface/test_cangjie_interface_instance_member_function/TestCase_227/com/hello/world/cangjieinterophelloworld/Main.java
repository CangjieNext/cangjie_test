/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import UNNAMED.CangjieInterface;

public class Main {
  public static void main(String[] args) {
    final CangjieInterface instance = new JavaClass();
    final String actualResult = instance.foo(new byte[114514], (short) 1);
    final boolean comparisonResult = actualResult.equals("hello");
    System.out.println("result = " + comparisonResult);
  }
}
