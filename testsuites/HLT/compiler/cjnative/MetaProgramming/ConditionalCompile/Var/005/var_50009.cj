/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %conditional_compilation_config_opt="a=1" %cmp_opt %f -o %output

@When[a=="1"]
package a  

@When[a=="1"]
main(){
    print("a = 1\n")
    0
}
// ASSERT: scan parse_unexpected_anno_on
