// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)DEPENDENCE: %n.file.cj
// (CJNATIVE and Linux)EXEC: %compiler %f --output-type=dylib -o libplugin1.so --import-path $CANGJIE_STDX_PATH -L$CANGJIE_STDX_PATH -lstdx.chir
// (CJNATIVE and Linux)EXEC-1: %compiler %n.file.cj --plugin=./libplugin1.so -o %output | compare %f

import stdx.chir.*

@C public func transformCHIRPackage(_: CPointer<Memory>): Unit {
    throw Exception("no implementation")
}
// ASSERT: scan no implementation