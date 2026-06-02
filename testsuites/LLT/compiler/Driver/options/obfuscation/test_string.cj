// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %cmp_opt %f -o main.%suffix
/* The string should be found in the binary, the following command returns 0 */
//  EXEC-0: strings main.%suffix | %grep "MS1 C5CF B6ED1 97C0 5194"

//  EXEC: %compiler %cmp_opt %f --fobf-string -o main.%suffix
//  EXEC: ./main.%suffix
/* The string should not be found in the binary, the following command returns 1 */
//  EXEC-1: strings main.%suffix | %grep "MS1 C5CF B6ED1 97C0 5194"

var mystr = "MS1 C5CF B6ED1 97C0 5194"

main() {
    return 0;
}
