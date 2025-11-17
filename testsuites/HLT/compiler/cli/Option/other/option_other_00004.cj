/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-1: %compiler %cmp_opt --diagnostic-format=default %f &> test.log
// EXEC: grep -q "\[36m.*\[0m" test.log
// EXEC-1: %compiler %cmp_opt --diagnostic-format=noColor %f &> test.log
// EXEC: grep -q "\[36m.*\[0m" test.log; if [ "$?" -ne "0" ]; then exit 0; else exit 1; fi

main() {
    aaa
}
