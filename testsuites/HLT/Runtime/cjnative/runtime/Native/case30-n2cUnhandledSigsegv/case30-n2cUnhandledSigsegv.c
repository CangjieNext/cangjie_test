/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdlib.h>
extern void C2CJ_Func();


void CTest1() {
  int *valuePtr = (int*)0x10;
  int value = *valuePtr;
}

void CfooSignal() {
  CTest1();
}

void CfooTest() {
  C2CJ_Func();
}
