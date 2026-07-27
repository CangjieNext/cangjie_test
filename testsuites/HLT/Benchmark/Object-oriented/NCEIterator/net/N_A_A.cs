/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
abstract class N_A_A : N, M_A
{
    protected N_A_A()
    {
        switch (Cascading)
        {
            case true when _constrained:
                CheckableCount++;
                return;
            case false:
                NonCascadingCount++;
                break;
        }

        if (IsMarkedValue)
        {
            NonCheckableMarkedCount++;
        }
    }

    public abstract ElementKind Kind { get; }
    public abstract ElementKind KindVerified { get; }

    public bool Cascading { get; } = Random.Shared.NextBoolean();

    public bool CascadingVerified
    {
        get
        {
            ++CallCount;
            return Cascading;
        }
    }

    private readonly bool _constrained = Random.Shared.NextBoolean();

    public virtual bool Constrained => _constrained;

    public virtual bool ConstrainedVerified
    {
        get
        {
            ++CallCount;
            return _constrained;
        }
    }
}