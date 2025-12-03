// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/**
 * @file
 *
 * This file gives a demo for MetaTransform.
 */

#include "MetaTransform.h"
#include "cangjie/CHIR/IR/CHIRBuilder.h"

#include <iostream>

using namespace Cangjie;

struct MyPlugin1 : MetaTransform<CHIR::Func> {
    MyPlugin1(CHIR::CHIRBuilder& builder) : builder(builder)
    {
        builder.EnableIRCheckerAfterPlugin();
    }
    void Run(CHIR::Func& func);
    CHIR::CHIRBuilder& builder;
    size_t cnt = 0;
};

// 实现 plugin
void MyPlugin1::Run(CHIR::Func& func)
{
    ++cnt;
    std::cout << "Found " << cnt << " funcs" << std::endl;
}


// 注册 plugin 到编译流程
CHIR_PLUGIN(MyPlugin1)
