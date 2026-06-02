// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %target=%host_arch-%host_os-%host_env -o %output
// (CJNATIVE) EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (CJNATIVE) ASSERT: regex-auto Everything is great

main() {
    print("Everything is great")
}
