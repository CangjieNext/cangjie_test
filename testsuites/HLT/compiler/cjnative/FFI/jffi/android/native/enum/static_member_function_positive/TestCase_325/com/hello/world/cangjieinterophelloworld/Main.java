/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import UNNAMED.CangjieEnum;

public class Main {
  public static void main(String[] args) {
    final String actualResult = CangjieEnum.foo("hello", new int[114514], new char[114514]);
    final boolean comparisonResult = actualResult.equals("hello");
    Logger.println("result = " + comparisonResult);
  }
}
