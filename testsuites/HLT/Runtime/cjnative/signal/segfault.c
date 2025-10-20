/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
int foo(){
   char *p;
   p = NULL;
   *p = 'x';
   printf("%c", *p);
   return 0;
}
