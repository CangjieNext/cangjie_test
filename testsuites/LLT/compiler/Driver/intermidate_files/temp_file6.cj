// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE and Linux) EXEC: unset TMPDIR && %compiler %f %verbose_opt 2>&1 | compare %f
// (not CJNATIVE and Linux) ASSERT: regex jc(.exe)?['"] .*?-pdblocation=/tmp/cangjie-tmp-[0-9a-zA-Z]+-[0-9a-f]+/\.pdb

main() {
    return 0
}
