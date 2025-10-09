/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 2
// DEPENDENCE: ./a
// EXEC: mkdir ./b
// EXEC: %compiler %cmp_opt --cfg="./a/"  --cfg="./b/" %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

@When[lion == "target"]
var aa = 0
@When[lion == "target_0"]
var aa = 1

main() {
    aa
}
