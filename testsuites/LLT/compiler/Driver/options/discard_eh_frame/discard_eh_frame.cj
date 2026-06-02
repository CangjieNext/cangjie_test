// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE: %compiler --discard-eh-frame %verbose_opt %f 2>&1 -o %output | compare %f
// (CJNATIVE and not Windows) ASSERT: regex ld?['"] .*discard_eh_frame.lds
// (CJNATIVE and not Windows) EXEC: %run_opt %output

main() {
    return 0
}
