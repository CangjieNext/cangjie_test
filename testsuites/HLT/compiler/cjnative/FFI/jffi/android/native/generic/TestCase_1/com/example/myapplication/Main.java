/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import UNNAMED.*;

public class Main {
  public static void main(String[] args) {
    final CangjieClassBool classInstance1 = new CangjieClassBool(true, true);
    classInstance1.instanceMemberFunction(true);
    final CangjieClassInt8 classInstance2 = new CangjieClassInt8((byte) 1, (byte) 1);
    classInstance2.instanceMemberFunction((byte) 1);
    final CangjieClassInt16 classInstance3 = new CangjieClassInt16((short) 1, (short) 1);
    classInstance3.instanceMemberFunction((short) 1);
    final CangjieClassInt32 classInstance4 = new CangjieClassInt32(1, 1);
    classInstance4.instanceMemberFunction(1);
    final CangjieClassInt64 classInstance5 = new CangjieClassInt64(1L, 1L);
    classInstance5.instanceMemberFunction(1L);
    final CangjieClassFloat32 classInstance6 = new CangjieClassFloat32(114.514000F, 114.514000F);
    classInstance6.instanceMemberFunction(114.514000F);
    final CangjieClassFloat64 classInstance7 = new CangjieClassFloat64(114.514000D, 114.514000D);
    classInstance7.instanceMemberFunction(114.514000D);
    final CangjieStructBool structInstance1 = new CangjieStructBool(true, true);
    structInstance1.instanceMemberFunction(true);
    final CangjieStructInt8 structInstance2 = new CangjieStructInt8((byte) 1, (byte) 1);
    structInstance2.instanceMemberFunction((byte) 1);
    final CangjieStructInt16 structInstance3 = new CangjieStructInt16((short) 1, (short) 1);
    structInstance3.instanceMemberFunction((short) 1);
    final CangjieStructInt32 structInstance4 = new CangjieStructInt32(1, 1);
    structInstance4.instanceMemberFunction(1);
    final CangjieStructInt64 structInstance5 = new CangjieStructInt64(1L, 1L);
    structInstance5.instanceMemberFunction(1L);
    final CangjieStructFloat32 structInstance6 = new CangjieStructFloat32(114.514000F, 114.514000F);
    structInstance6.instanceMemberFunction(114.514000F);
    final CangjieStructFloat64 structInstance7 = new CangjieStructFloat64(114.514000D, 114.514000D);
    structInstance7.instanceMemberFunction(114.514000D);
    final CangjieEnumBool enumInstance1 = CangjieEnumBool.A(true);
    enumInstance1.instanceMemberFunction(true);
    enumInstance1.getInstancecMemberProperty();
    final CangjieEnumInt8 enumInstance2 = CangjieEnumInt8.A((byte) 1);
    enumInstance2.instanceMemberFunction((byte) 1);
    enumInstance2.getInstancecMemberProperty();
    final CangjieEnumInt16 enumInstance3 = CangjieEnumInt16.A((short) 1);
    enumInstance3.instanceMemberFunction((short) 1);
    enumInstance3.getInstancecMemberProperty();
    final CangjieEnumInt32 enumInstance4 = CangjieEnumInt32.A(1);
    enumInstance4.instanceMemberFunction(1);
    enumInstance4.getInstancecMemberProperty();
    final CangjieEnumInt64 enumInstance5 = CangjieEnumInt64.A(1L);
    enumInstance5.instanceMemberFunction(1L);
    enumInstance5.getInstancecMemberProperty();
    final CangjieEnumFloat32 enumInstance6 = CangjieEnumFloat32.A(114.514000F);
    enumInstance6.instanceMemberFunction(114.514000F);
    enumInstance6.getInstancecMemberProperty();
    final CangjieEnumFloat64 enumInstance7 = CangjieEnumFloat64.A(114.514000D);
    enumInstance7.instanceMemberFunction(114.514000D);
    enumInstance7.getInstancecMemberProperty();
    final CangjieInterfaceBool interfaceInstance1 = new JavaClassBool();
    interfaceInstance1.instanceMemberFunction(true);
    interfaceInstance1.abstractInstanceMemberFunction(true);
    final CangjieInterfaceInt8 interfaceInstance2 = new JavaClassInt8();
    interfaceInstance2.instanceMemberFunction((byte) 1);
    interfaceInstance2.abstractInstanceMemberFunction((byte) 1);
    final CangjieInterfaceInt16 interfaceInstance3 = new JavaClassInt16();
    interfaceInstance3.instanceMemberFunction((short) 1);
    interfaceInstance3.abstractInstanceMemberFunction((short) 1);
    final CangjieInterfaceInt32 interfaceInstance4 = new JavaClassInt32();
    interfaceInstance4.instanceMemberFunction(1);
    interfaceInstance4.abstractInstanceMemberFunction(1);
    final CangjieInterfaceInt64 interfaceInstance5 = new JavaClassInt64();
    interfaceInstance5.instanceMemberFunction(1L);
    interfaceInstance5.abstractInstanceMemberFunction(1L);
    final CangjieInterfaceFloat32 interfaceInstance6 = new JavaClassFloat32();
    interfaceInstance6.instanceMemberFunction(114.514000F);
    interfaceInstance6.abstractInstanceMemberFunction(114.514000F);
    final CangjieInterfaceFloat64 interfaceInstance7 = new JavaClassFloat64();
    interfaceInstance7.instanceMemberFunction(114.514000D);
    interfaceInstance7.abstractInstanceMemberFunction(114.514000D);
  }
}
