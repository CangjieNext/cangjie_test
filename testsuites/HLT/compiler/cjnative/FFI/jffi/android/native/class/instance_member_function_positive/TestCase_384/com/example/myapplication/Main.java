/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import UNNAMED.AnotherCangjieClass;
import UNNAMED.CangjieClass;

public class Main {
  public static void main(String[] args) {
    final CangjieClass instance = new CangjieClass();
    final short[] actualResult = instance.foo((char) 1, (byte) 1, new AnotherCangjieClass());
    final boolean comparisonResult = actualResult.length == 114514L;
    Logger.println("result = " + comparisonResult);
  }
}
