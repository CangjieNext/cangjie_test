/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

@When[os == "Linux"]
main() {
    print("linux\n")
    return 0
}

@When[os == "Windows"]
main() {
    print("windows\n")
    return 0
}

@When[os == "macOS"]
main() {
    print("macOS\n")
    return 0
}
