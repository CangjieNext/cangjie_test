/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows and not iOS) EXEC-PIPE: rm -rf dir;mkdir dir
// (Windows) EXEC-PIPE: mkdir dir
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output --output-dir=./dir
// (not OHOS and not iOS) RUN-EXEC: %run %run_opt ./dir/%output
main() {
    return 0
}
