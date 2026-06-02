// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux) EXEC: unset TMPDIR
// (Linux) EXEC: touch $(pwd)/is_a_file
// (Linux) ERRCHECK: export TMPDIR=$(pwd)/is_a_file && %compiler %cmp_opt %f -o main
// (Linux) ASSERT: scan Temporary directory path set by environment variable(TMPDIR) is not a directory.
// (Linux) EXEC: rm $(pwd)/is_a_file

main () {
    print("hello world")
    return 0
}
