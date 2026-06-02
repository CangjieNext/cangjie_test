/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %obf_layout %f -o %output --obf-sym-output-mapping
// ASSERT: scan this Option needs a value: '--obf-sym-output-mapping'

func test() {
    var a = 1
    print(a)
}

main() {
    test()
    return 0
}
