// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)DEPENDENCE: test_chir.file.cj
// (CJNATIVE and Linux)EXEC: %compiler %f --output-type=dylib -o libplugin1.so --import-path $CANGJIE_STDX_PATH -L$CANGJIE_STDX_PATH -lstdx.chir
// (CJNATIVE and Linux)EXEC-PIPE-1: %set_stdx_path %compiler test_chir.file.cj --plugin=./libplugin1.so 2>&1 | compare %f

import stdx.chir.*

@C public func transformCHIRPackage(_: CPointer<Memory>): Unit {
    unsafe {
        let v = CPointer<Int64>()
        v.write(42)
    }
}

// ASSERT: regex-begin E\s+CJNatvie Handle signal: 11
// ASSERT: scan run CHIR plugin returned null package
