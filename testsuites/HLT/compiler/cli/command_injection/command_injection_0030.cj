/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: i_should_not_appear_in_command.txt
// EXEC: mkdir \''> test.log'; 
// EXEC: cp -rf $CANGJIE_HOME/* \''> test.log'
// EXEC: CANGJIE_HOME=\''> test.log' PATH=\''> test.log/bin':$PATH %compiler %cmp_opt %f
// (not MAC ) EXEC-PIPE-2: ls test.log 2>&1 | compare %f
// (MAC) EXEC-PIPE-1: ls test.log 2>&1 | compare %f
// ASSERT: scan No such file or directory

main() {
    0
}
