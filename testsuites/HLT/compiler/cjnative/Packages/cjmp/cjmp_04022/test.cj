/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f %compile_chir_opt -o ./
// ASSERT: scan parse_cjmp_in_common_ctor_required

public common class A {
    public static var a1 = 1
    public var a2 = -1
}
func f() {
    A.a1 + A().a2
}


