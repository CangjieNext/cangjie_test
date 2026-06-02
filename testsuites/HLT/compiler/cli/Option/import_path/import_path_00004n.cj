/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: libs
// EXEC: %compiler %cmp_opt --module-name myModule %compile_lib_opt libs/myModule/myModule.cj -o libs/myModule/
// EXEC: %compiler %cmp_opt --import-path=libs -L libs/myModule -l myModule %f -o %output 2>&1 | compare %f

import myModule.myModule.*

main() {
    return test()
}
// ASSERT: regex-not no position error occurred
