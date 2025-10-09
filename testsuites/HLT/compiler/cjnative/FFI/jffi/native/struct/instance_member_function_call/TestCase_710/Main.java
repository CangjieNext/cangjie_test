/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package java_entry;

import UNNAMED.S;

public class Main {
  public static void main(String[] args) {
    final S s = new S();
    final byte actualResult = s.foo(114.514000D, 1L, new int[114514]);
    final byte expectedResult = (byte) 1;
    final boolean comparisonResult = actualResult == expectedResult;
    System.out.println("result = " + comparisonResult);
  }
}
