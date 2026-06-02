// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %mkdir tmps
// EXEC: %compiler %cmp_opt %compile_lib_opt %disableAPC %f %save_temps_opt=tmps
// EXEC: %llvmDissembler tmps/%n.bc -o tmps/%n.ll
// EXEC-PIPE: %cat tmps/%n.ll 2>&1 | compare %f
// ASSERT: regex @_CN7default1xE = global i64 \(\)\* null, align 8, !GlobalVarType !(?P<x_layout_id>[0-9]+)
// ASSERT: regex !(?P=x_layout_id) = !{!"FClvE"}

public var x: CFunc<() -> Int64> = {=> return 1}
