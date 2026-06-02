// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0:%compiler %f %import_path_opt ./nofolder -o %output 2>&1 | compare %f
// ASSERT: scan No such directory

main() {
    return 0
}
