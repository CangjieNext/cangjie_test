/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import UNNAMED.Impl;

public class Main {
  public static void main(String[] args) {
    Logger.println("run java");
    Impl cjEntryPoint = new Impl();
    String res0 = cjEntryPoint.bar("hello");
    Logger.println("res0 = " + res0);
    String res1 = cjEntryPoint.bar1("world");
    Logger.println("res1 = " + res1);
  }
}
