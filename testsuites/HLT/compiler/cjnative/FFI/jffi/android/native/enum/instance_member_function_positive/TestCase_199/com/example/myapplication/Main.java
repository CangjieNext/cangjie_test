/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import UNNAMED.CangjieEnum;

public class Main {
  public static void main(String[] args) {
    final CangjieEnum instance = CangjieEnum.A;
    final double[] actualResult = instance.foo("hello", new int[114514], new char[114514]);
    final boolean comparisonResult = actualResult.length == 114514L;
    Logger.println("result = " + comparisonResult);
  }
}
