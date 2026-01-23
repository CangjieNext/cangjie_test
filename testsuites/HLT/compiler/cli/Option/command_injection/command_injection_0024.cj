/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: i_should_not_appear_in_command.txt
// (not Windows) EXEC: mkdir \''; ls'; 
// (not Windows) EXEC: cp -rf $CANGJIE_HOME/* \''; ls'
// (not Windows) EXEC-PIPE-1: CANGJIE_HOME=\''; ls' PATH=\''; ls/bin':$PATH cjc %cmp_opt %f 2>&1 | compare %f
// (not Windows) ASSERT: scan-not i_should_not_appear_in_command
// (not Windows) ASSERT: regex error.* Invalid cjc installation path
// (not Windows) ASSERT: regex info.* Do not install `cjc` under a path that contains the following characters: :;

main() {
    0
}
