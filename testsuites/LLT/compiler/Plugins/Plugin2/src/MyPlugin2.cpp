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

#include <iostream>

using namespace Cangjie;

struct MyPlugin2 : MetaTransform<CHIR::Package> {
    MyPlugin2(CHIR::CHIRBuilder& builder) : builder(builder)
    {
    }
    void Run(CHIR::Package& func);
    CHIR::CHIRBuilder& builder;
    size_t cnt = 0;
};

// 实现 plugin
void MyPlugin2::Run(CHIR::Package& func)
{
    throw "abc";
}

// 注册 plugin 到编译流程
CHIR_PLUGIN(MyPlugin2)
