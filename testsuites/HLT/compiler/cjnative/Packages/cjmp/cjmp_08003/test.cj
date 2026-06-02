/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f %compile_chir_opt -o ./
// ASSERT: scan parse_cjmp_outdecl_miss_match

public common class A {}
public common interface I {
    common func t1(): Unit {}
    func t2() {}
}
extend A <: I {
    public common func f(): Int64 { 0 }
}


