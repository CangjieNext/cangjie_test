// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux) EXEC: mkdir -p ./output1/output2/
// (Linux) EXEC: chmod 777 ./output1/output2
// (Linux) EXEC: chmod 555 ./output1/
// (Linux) EXEC: %compiler %cmp_opt %f -o ./output1/output2/%output
// (Linux) EXEC: %run %run_opt ./output1/output2/%output %run_args

main() {
    print("Everything is great")
    return 0
}
