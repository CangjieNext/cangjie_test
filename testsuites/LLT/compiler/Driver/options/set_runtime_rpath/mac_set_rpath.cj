// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Darwin) EXEC-PIPE-0: %compiler %f --set-runtime-rpath -o %output
// (CJNATIVE and Darwin) EXEC-0: unset DYLD_LIBRARY_PATH && %run_opt %output

main() {
    return 0
}
