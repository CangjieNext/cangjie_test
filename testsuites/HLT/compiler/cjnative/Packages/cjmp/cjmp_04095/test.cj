/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f %compile_chir_opt -o %output
// ASSERT: scan-2 parse_cjmp_outdecl_miss_match

public class A {
    public common prop p1: Int64 { get() { 0 } }
    public common static prop p2: Int64 { get() { 0 } }
}


