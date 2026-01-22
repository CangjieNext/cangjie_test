/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import UNNAMED.CangjieClass;

public class Main {
  public static void main(String[] args) {
    final CangjieClass instance = new CangjieClass();
    final byte actualResult = instance.foo(new float[114514], (byte) 1, 1L);
    final byte expectedResult = (byte) 1;
    final boolean comparisonResult = actualResult == expectedResult;
    System.out.println("result = " + comparisonResult);
  }
}
