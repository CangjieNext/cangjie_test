// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: mkdir temp
//  ERRCHECK: %compiler %cmp_opt %f --save-temps . --fobf-const --obf-config temp -o %output 2>&1 | compare %f

main() {
    return 0
}

/* SCAN
[31merror[0m: Not a file: 'temp'.
Invalid options. Try: 'cjc --help' for more information.
*/
