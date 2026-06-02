/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
// DEPENDENCE: pkg
// (not O2 and not Windows) EXEC: %compiler %cmp_opt %compile_lib_opt %obf_layout --obf-sym-prefix A --obf-sym-output-mapping A.map pkg/pkga.cj -o pkga.%middle
// (not O2 and not MAC and not Windows) EXEC: %sed -i "s/_CN/aaaa_CN/g" A.map
// (not O2 and MAC) EXEC: %sed -i "" "s/_CN/aaaa_CN/g" A.map
// (not O2 and not Windows and not iOS) ERRCHECK: %compiler %cmp_opt %obf_layout --obf-sym-input-mapping A.map %f pkga.%middle -o %output
// (not MAC and not Windows) ASSERT: regex undefined reference to `_CN2p18global_aE'
// (not MAC and not Windows) ASSERT: regex undefined reference to `_CN2p16test_aHv'
// (MAC and not OHOS and not Windows) ASSERT: regex undefined symbol: __CN2p16test_aHv
// (MAC and not OHOS and not Windows) ASSERT: regex undefined symbol: __CN2p18global_aE
// (OHOS) ASSERT: regex undefined symbol: _CN2p18global_aE
// (OHOS) ASSERT: regex undefined symbol: _CN2p16test_aHv

import p1.*

public var global_default: Int64 = 1

public func test_default() {
}

main() {
    print(global_a)
    print(global_default)
    test_a()
    test_default()
    return 0
}
