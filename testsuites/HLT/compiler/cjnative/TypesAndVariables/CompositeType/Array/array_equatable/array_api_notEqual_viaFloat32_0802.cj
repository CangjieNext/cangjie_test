/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
main() {
    let arrViaFloat32F: Array<Float32> = [16.1, 6.5, 9.6]
    let arrViaFloat32S: Array<Float32> = [16.1, 6.5, 9.6, 182.0]
    if (!(arrViaFloat32F != arrViaFloat32S)) {
        return 1
    }
    return 0
}
