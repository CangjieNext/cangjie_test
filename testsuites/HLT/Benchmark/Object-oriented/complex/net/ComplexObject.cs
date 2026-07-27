/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
sealed class ComplexObject
{
    readonly long _re;
    readonly long _im;

    internal ComplexObject(long re, long im)
    {
        _re = re;
        _im = im;
    }

    public long Modulus2 => _re * _re + _im * _im;
}