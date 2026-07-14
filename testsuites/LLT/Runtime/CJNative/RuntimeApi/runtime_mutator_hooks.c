/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "runtime_api_test.h"

#include <assert.h>
#include <pthread.h>
#include <stdint.h>
#include <stdio.h>

uintptr_t MRT_CreateMutator(void);
uintptr_t MRT_TransitMutatorToExit(void);
uintptr_t MRT_GetSafepointProtectedPage(void);
bool MRT_NewForeignCJThread(void);
bool MRT_EndForeignCJThread(void);

static void *RunForeignMutator(void *arg) {
  (void)arg;
  assert(MRT_NewForeignCJThread());
  assert(!MRT_NewForeignCJThread());
  assert(MRT_EndForeignCJThread());
  return NULL;
}

int main(void) {
  struct RuntimeParam param = {0};
  param.logParam.logLevel = RTLOG_OFF;
  assert(InitCJRuntime(&param) == E_OK);
  assert(MRT_GetSafepointProtectedPage() == 1);

  assert(MRT_CreateMutator() == 0);
  assert(MRT_TransitMutatorToExit() == 0);
  assert(MRT_CreateMutator() == 0);
  assert(MRT_TransitMutatorToExit() == 0);

  pthread_t foreignThread;
  assert(pthread_create(&foreignThread, NULL, RunForeignMutator, NULL) == 0);
  assert(pthread_join(foreignThread, NULL) == 0);

  assert(FiniCJRuntime() == E_OK);
  puts("runtime mutator hooks pass");
  return 0;
}
