/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
	
const enum E {
    e1
    const prop var aa: Int64 {}
}

main(){
    return 0
}
// ASSERT: scan parse_illegal_modifier_in_scope
// ASSERT: scan parse_expected_name
// ASSERT: scan parse_expected_decl
