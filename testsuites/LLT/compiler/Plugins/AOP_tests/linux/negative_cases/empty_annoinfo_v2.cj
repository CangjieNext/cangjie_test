// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-1: printf '#aspect_cj_annoinfo_v2\n' > empty-default.annoinfo && export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %weave_aspects_plugin 2>&1 | compare %f
// (CJNATIVE and Linux)ASSERT: scan Missing aspect record in metadata `empty-default.annoinfo`.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

main() {
    0
}
