// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test_package
// (CJNATIVE) EXEC: %compiler ./test_package/address_test.cj ./test_package/locale_test.cj --output-type=dylib --save-temps ./ --apc=1
// (CJNATIVE) EXEC: %llvmDissembler test_package.bc -o test_package.ll
// (CJNATIVE) EXEC: %cat test_package.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal void @"_CN12test_packageUaddress_test$4Test10prefixTestHv"
// (CJNATIVE) ASSERT: scan define internal void @"_CN12test_packageUlocale_test$4Test10prefixTestHv"
// (CJNATIVE) ASSERT: scan @"test_package:_CN12test_packageUaddress_test$4TestE.ti" = internal global %TypeInfo
// (CJNATIVE) ASSERT: scan @"test_package:_CN12test_packageUlocale_test$4TestE.ti" = internal global %TypeInfo
// (CJNATIVE) EXEC: %compiler %f -L ./ -ltest_package -o %output
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

import test_package.*

main() {
    foo()
    goo()
    0
}