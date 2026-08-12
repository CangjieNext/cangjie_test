/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
interface M_A : A
{
    ElementKind Kind { get; }
    ElementKind KindVerified { get; }
    bool Cascading { get; }
    bool CascadingVerified { get; }
    bool Constrained { get; }
    bool ConstrainedVerified { get; }
}