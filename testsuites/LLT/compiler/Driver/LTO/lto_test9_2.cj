// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %compiler %verbose_opt --lto=full --ffunction-sections %f 2>&1 -o %output | compare %f
// (Linux and CJNATIVE and DEBUG_OPTION) ASSERT: regex opt?['"] .*-function-sections
// (Linux and CJNATIVE and DEBUG_OPTION) ASSERT: regex lld?['"] .*-function-sections
// (Linux and CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args

main() {
    return 0
}
