
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DESCRIPTION: exec -l /bin/bash -c "xxx"
// EXEC: exec -l /bin/bash -c "%cangjie-home/envsetup.sh && %compiler %cmp_opt %f -o %output && %run %run_opt %output %run_args"

main(): Unit {

}
