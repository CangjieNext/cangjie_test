/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

public class JavaClass {
  public JavaClass() {
    System.out.println("java: JavaClass()");
  }

  public void takeArr(long[] arr) {
    for (int i = 0; i < arr.length; i++) {
      System.out.println("java: " + i + "th of long[] - " + arr[i]);
    }
  }
  ;

  public long[] getArr() {
    long[] a = {6, 7, 13};
    return a;
  }
  ;

  public void takeArr2(JavaClass[] arr) {
    for (int i = 0; i < arr.length; i++) {
      System.out.println("java: " + i + "th of JavaClass[] - " + arr[i].getInt());
    }
  }
  ;

  public JavaClass[] getArr2() {
    JavaClass[] a = {new JavaClass(), new JavaClass(), new JavaClass()};
    return a;
  }
  ;

  public long getInt() {
    return 55312;
  }
  ;
}
