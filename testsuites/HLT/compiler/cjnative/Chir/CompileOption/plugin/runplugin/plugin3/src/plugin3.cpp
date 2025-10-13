/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
#include "MetaTransform.h"
#include <iostream>
 
using namespace Cangjie;
 
struct Plugin3 : MetaTransform<CHIR::Package> {
    Plugin3(CHIR::CHIRBuilder& builder) : builder(builder)
    {
    }
    void Run(CHIR::Package& Package);
    CHIR::CHIRBuilder& builder;
    size_t cnt = 0;
};

// 实现 plugin
void Plugin3::Run(CHIR::Package& Package)
{
    ++cnt;
    std::cout << "Found " << cnt << " Packages" << std::endl;
}

// 注册 plugin 到编译流程
CHIR_PLUGIN(Plugin3)