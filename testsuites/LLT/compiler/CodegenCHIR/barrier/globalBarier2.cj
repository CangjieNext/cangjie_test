// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir %cmp_opt %disableReflection %n.cj 2>&1 | compare %f
// ASSERT: regex-auto call void @llvm.cj.gcwrite.static.struct(i8* bitcast (%"record.default:b<l,ab>"* @_CN7default1aE to i8*), i8*
// EXEC: %compiler %cmp_opt %disableReflection %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix


var a: b<Int64, Bool> = b()

public class j {}

struct b<l, ab>{
    let ac= (j(), ())
}

main() {
    a
    0
}