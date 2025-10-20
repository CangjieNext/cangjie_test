/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package java_entry;

import UNNAMED.ChildClass;

public class Main {
  public static void main(String[] args) {
    final ChildClass childClass =
        new ChildClass(
            new double[114514],
            1L,
            114.514000F,
            new short[114514],
            1L,
            (byte) 1,
            new float[114514],
            (char) 1,
            "hello",
            new byte[114514]);
    System.out.println("hello");
  }
}
