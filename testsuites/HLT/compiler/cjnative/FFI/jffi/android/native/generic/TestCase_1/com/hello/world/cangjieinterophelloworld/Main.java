/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import UNNAMED.*;

public class Main {
  public static void main(String[] args) {
    final CangjieInterfaceInt interfaceInstance1 = new JavaClassInt();
    interfaceInstance1.instanceMemberFunction(1L);
    final CangjieInterfaceInt8 interfaceInstance2 = new JavaClassInt8();
    interfaceInstance2.instanceMemberFunction((byte) 1);
    final CangjieInterfaceInt16 interfaceInstance3 = new JavaClassInt16();
    interfaceInstance3.instanceMemberFunction((short) 1);
    final CangjieInterfaceInt32 interfaceInstance4 = new JavaClassInt32();
    interfaceInstance4.instanceMemberFunction(1);
    final CangjieInterfaceInt64 interfaceInstance5 = new JavaClassInt64();
    interfaceInstance5.instanceMemberFunction(1L);
    final CangjieInterfaceUInt16 interfaceInstance6 = new JavaClassUInt16();
    interfaceInstance6.instanceMemberFunction((char) 1);
    final CangjieInterfaceFloat32 interfaceInstance7 = new JavaClassFloat32();
    interfaceInstance7.instanceMemberFunction(114.514000F);
    final CangjieInterfaceFloat64 interfaceInstance8 = new JavaClassFloat64();
    interfaceInstance8.instanceMemberFunction(114.514000D);
  }
}
