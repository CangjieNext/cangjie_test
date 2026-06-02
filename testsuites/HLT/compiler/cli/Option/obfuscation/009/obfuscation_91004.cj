/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %obf_layout %f -o %output --obf-apply-mapping-file
// ASSERT: scan this Option needs a value: '--obf-apply-mapping-file'

public var global_default: Int64 = 1

public func test_default() {
}

main() {
    print(global_default)
    test_default()
    return 0
}
