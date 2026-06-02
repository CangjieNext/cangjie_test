/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <sys/types.h>
#include <stdint.h>

int LLVMFuzzerRunDriver(int *argc, char ***argv, int (*UserCb)(const uint8_t *Data, size_t Size))
{
    UserCb((const uint8_t *)"", 0);
    UserCb((const uint8_t *)"Hello", 5);
    UserCb((const uint8_t *)"world", 5);
    UserCb((const uint8_t *)"12345678", 8);
    return 0;
}

void __sanitizer_cov_8bit_counters_init(uint8_t *start, uint8_t *stop)
{
    return;
}

void __sanitizer_weak_hook_strncmp(void *called_pc, const char *s1, const char *s2, size_t n, int result)
{
    return;
}

void __sanitizer_cov_pcs_init(const uintptr_t *pcs_beg, const uintptr_t *pcs_end)
{
    return;
}

void __sanitizer_weak_hook_strcmp(void *called_pc, const char *s1, const char *s2, int result)
{
    return;
}

void __sanitizer_weak_hook_memcmp(void *called_pc, const void *s1, const void *s2, size_t n, int result)
{
    return;
}

void __sanitizer_weak_hook_strcasecmp(void *called_pc, const char *s1, const char *s2, int result)
{
    return;
}