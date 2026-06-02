/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: mkdir aa
// ERRCHECK: %compiler %cmp_opt --cfg="./aa" %f -o %output
// ASSERT: scan conditional_compilation_not_support_this_condition

@When[lion == "target"]
var a = 0
@When[lion == "target_0"]
var a = 1

main() {
    a
}
