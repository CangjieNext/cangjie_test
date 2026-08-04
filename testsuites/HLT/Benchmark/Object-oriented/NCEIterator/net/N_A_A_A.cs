/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
class N_A_A_A : N_A_A
{
    public override ElementKind Kind => Bean;

    public override ElementKind KindVerified
    {
        get
        {
            ++CallCount;
            return Bean;
        }
    }
}