/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import UNNAMED.AnotherCangjieStruct;
import UNNAMED.CangjieEnum;

public class Main {
  public static void main(String[] args) {
    final AnotherCangjieStruct actualResult = CangjieEnum.foo((byte) 1, 114.514000F, 1L);
    final boolean comparisonResult = actualResult.getValue() == 114514L;
    Logger.println("result = " + comparisonResult);
  }
}
