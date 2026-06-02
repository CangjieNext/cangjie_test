// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux) EXEC: mkdir ./output
// (Linux) EXEC: chmod -r ./output
// (Linux) EXEC: %compiler %cmp_opt %f -o ./output/%output
// (Linux) EXEC: %run %run_opt ./output/%output
// (Linux) EXEC: chmod +r ./output

main() {
    print("Everything is great")
    return 0
}
