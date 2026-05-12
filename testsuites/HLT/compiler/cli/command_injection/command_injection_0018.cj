/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: i_should_not_appear_in_command.txt
// (not Windows) EXEC: mkdir \''|| ls'; 
// (not Windows) EXEC: cp -rf $CANGJIE_HOME/* \''|| ls'
// (not Windows) EXEC: CANGJIE_HOME=\''|| ls' PATH=\''|| ls/bin':$PATH %compiler %cmp_opt %f 2>&1 | compare %f
// (not Windows) ASSERT: scan-not i_should_not_appear_in_command

main() {
    0
}
