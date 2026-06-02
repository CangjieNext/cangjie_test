// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux and x86) DEPENDENCE: ../src/main.cj
// (CJNATIVE and Linux and x86) EXEC: %mkdir -p ./bin
// (CJNATIVE and Linux and x86) EXEC: %touch ./bin/dsymutil && %chmod +x ./bin/dsymutil
// (CJNATIVE and Linux and x86) EXEC: %mkdir -p ./cangjie
// (CJNATIVE and Linux and x86) EXEC: %cpdir -rf $CANGJIE_HOME/* ./cangjie
// (CJNATIVE and Linux and x86) EXEC: %cpdir -rf ./cangjie/modules/linux_x86_64_cjnative ./cangjie/modules/ios_simulator_aarch64_cjnative
// (CJNATIVE and Linux and x86) EXEC: source cangjie/envsetup.sh && %compiler %cmp_opt main.cj --toolchain ./bin -o %output --verbose --target=aarch64-apple-ios-simulator 2>&1 | compare %f
// (CJNATIVE and Linux and x86) ASSERT: regex /opt'.* '--mtriple=aarch64-apple-ios11-simulator'