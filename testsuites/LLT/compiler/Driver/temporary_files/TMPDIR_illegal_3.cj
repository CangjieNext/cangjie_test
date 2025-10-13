// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux) EXEC: mkdir $(pwd)/is_a_dir
// (Linux) EXEC: chmod -w $(pwd)/is_a_dir
// (Linux) ERRCHECK: export TMPDIR=$(pwd)/is_a_dir && %compiler %cmp_opt %f -o main
// (Linux) ASSERT: scan Temporary directory path set by environment variable (TMPDIR) does not have write permission.
// (Linux) EXEC: rm -rf $(pwd)/is_a_dir

main () {
    print("hello world")
    return 0
}
