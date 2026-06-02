// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %touch a_file
// EXEC: %compiler %cmp_opt %f -B a_file -o %output 2>&1 | compare %f

main() {
    return 0
}

/* SCAN
[33mwarning[0m: Not a directory: 'a_file'. The argument is ignored.
 [36m#[0m [0mnote[0m: this warning can be suppressed by setting the compiler option `-Woff driver-arg`
*/
