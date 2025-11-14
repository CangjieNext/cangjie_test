/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC-PIPE: rm -rf dir;mkdir dir
// (Windows) EXEC-PIPE: mkdir dir
// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt --output-type=exe %f -o %output --output-dir ./dir
// (CJNATIVE and not OHOS) RUN-EXEC-PIPE: %run %run_opt dir/%output %run_args

main() {
    return 0
}
