// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) ERRCHECK: %compiler %cmp_opt --apc=1 --static-std --target=x86_64-linux-ohos %f --verbose
// (CJNATIVE) ASSERT: scan Statically link packages of the std module is not supported for OHOS
 
main () {
    var str = "hello"
    print(str)
    return 0
}
