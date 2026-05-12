/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package com.example.myapplication;

import UNNAMED.CangjieClass;
import UNNAMED.CangjieStruct;
import UNNAMED.CangjieEnum;
// import UNNAMED.CangjieInterface;
// import UNNAMED.CangjieClassThatImplementsCangjieInterface;

public class Main {
  public static void testClass() {
    for (byte kind = 1; kind < 5; kind++) {
      try {
        final CangjieClass instance = new CangjieClass(kind);
      } catch (Exception e) {
        Logger.println("e = " + e.toString());
      }
    }
    final CangjieClass instance = new CangjieClass((byte) 0);
    for (byte kind = 1; kind < 5; kind++) {
      try {
        instance.instanceFunction(kind, (byte) 1);
      } catch (Exception e) {
        Logger.println("e = " + e.toString());
      }
    }
    for (byte kind = 1; kind < 5; kind++) {
      try {
        CangjieClass.staticFunction(kind);
      } catch (Exception e) {
        Logger.println("e = " + e.toString());
      }
    }
  }
  public static void testStruct() {
    for (byte kind = 1; kind < 5; kind++) {
      try {
        final CangjieStruct instance = new CangjieStruct(kind);
      } catch (Exception e) {
        Logger.println("e = " + e.toString());
      }
    }
    final CangjieStruct instance = new CangjieStruct((byte) 0);
    for (byte kind = 1; kind < 5; kind++) {
      try {
        instance.instanceFunction(kind, (byte) 1);
      } catch (Exception e) {
        Logger.println("e = " + e.toString());
      }
    }
    for (byte kind = 1; kind < 5; kind++) {
      try {
        CangjieStruct.staticFunction(kind);
      } catch (Exception e) {
        Logger.println("e = " + e.toString());
      }
    }
  }
  public static void testEnum() {
    for (byte kind = 1; kind < 5; kind++) {
      try {
        final CangjieEnum instance = CangjieEnum.A;
      } catch (Exception e) {
        Logger.println("e = " + e.toString());
      }
    }
    final CangjieEnum instance = CangjieEnum.A;
    for (byte kind = 1; kind < 5; kind++) {
      try {
        instance.instanceFunction(kind, (byte) 1);
      } catch (Exception e) {
        Logger.println("e = " + e.toString());
      }
    }
    for (byte kind = 1; kind < 5; kind++) {
      try {
        CangjieEnum.staticFunction(kind);
      } catch (Exception e) {
        Logger.println("e = " + e.toString());
      }
    }
  }
  // public static void testInterface() {
  //   for (byte kind = 1; kind < 5; kind++) {
  //     try {
  //       final CangjieInterface instance = new CangjieClassThatImplementsCangjieInterface(kind);
  //     } catch (Exception e) {
  //       Logger.println("e = " + e.toString());
  //     }
  //   }
  //   final CangjieInterface instance = new CangjieClassThatImplementsCangjieInterface((byte) 0);
  //   for (byte kind = 1; kind < 5; kind++) {
  //     try {
  //       instance.instanceFunction(kind, (byte) 1);
  //     } catch (Exception e) {
  //       Logger.println("e = " + e.toString());
  //     }
  //   }
  // }
  public static void main(String[] args) {
    Logger.println("run java Main");
    testClass();
    testStruct();
    testEnum();
    // testInterface();
    Logger.println("run java Main done");
  }
}
