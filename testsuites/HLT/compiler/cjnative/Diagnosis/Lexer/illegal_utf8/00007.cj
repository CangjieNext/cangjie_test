/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f 2>&1 | compare %f

public func test() {
    //   
    // 01 7f
    // �� ߿
    // c080 dfbf
    // ��� ￿
    // e08080 efbfbf
    // ���� ����
    // f0808080 f7bfbfbf
}

main() {}
// ASSERT: scan lex_unsecure_unicode
