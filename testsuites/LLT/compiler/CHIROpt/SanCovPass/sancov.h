// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#include<stdio.h>
#include<stdint.h>
#include<assert.h>

extern "C" void __sanitizer_cov_trace_pc_guard_init(uint32_t *start,
                                                    uint32_t *stop);

extern "C" void __sanitizer_cov_trace_pc_guard(uint32_t* index);

extern const char* counter;
extern int counter_length;

extern "C" void __sanitizer_cov_8bit_counters_init(char *start, char *end);

extern bool * flag;
extern int flag_length;

extern "C"
void __sanitizer_cov_bool_flag_init(bool *start, bool *end);

extern const uintptr_t *pc_table;
extern int table_length;

extern "C"
void __sanitizer_cov_pcs_init(const uintptr_t *pcs_beg,
                              const uintptr_t *pcs_end);

extern "C"
void __sanitizer_cov_trace_cmp1(uint8_t Arg1, uint8_t Arg2); 

extern "C"
void __sanitizer_cov_trace_const_cmp1(uint8_t Arg1, uint8_t Arg2); 

extern "C"
void __sanitizer_cov_trace_cmp2(uint16_t Arg1, uint16_t Arg2);

extern "C"
void __sanitizer_cov_trace_const_cmp2(uint16_t Arg1, uint16_t Arg2); 

extern "C"
void __sanitizer_cov_trace_cmp4(uint32_t Arg1, uint32_t Arg2);

extern "C"
void __sanitizer_cov_trace_const_cmp4(uint32_t Arg1, uint32_t Arg2);

extern "C"
void __sanitizer_cov_trace_cmp8(uint64_t Arg1, uint64_t Arg2); 

extern "C"
void __sanitizer_cov_trace_const_cmp8(uint64_t Arg1, uint64_t Arg2);

extern "C"
void __sanitizer_cov_trace_switch(uint64_t Val, uint64_t *Cases);

extern "C"
void __cj_sanitizer_weak_hook_memcmp(const void *s1, const void *s2, size_t n);

extern "C"
void __cj_sanitizer_weak_hook_strncmp(const char *s1, const char *s2, size_t n);

extern "C"
void __cj_sanitizer_weak_hook_strcasecmp(const char *s1, const char *s2);

extern "C"
void __cj_sanitizer_weak_hook_strcmp(const char *s1, const char *s2);

//extern thread_local void*  __sancov_lowest_stack;
thread_local void* __sancov_lowest_stack;