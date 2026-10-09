// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: printf '#aspect_cj_annoinfo_v2\nother\nmissing.aspect.init\nInsertAtEntry\nother\nmissing.advice\n0\nfalse\nfalse\nfalse\n__aspect_cj_wildcard__\n\ntarget\n()->Unit\nfalse\nfalse\n' > other-__aspect_cj_wildcard__.annoinfo && export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %weave_aspects_plugin && %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan target
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public func target(): Unit {
    println("target")
}

main() {
    target()
    0
}
