/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
#define PLAIN

#if PLAIN
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
#endif

#if PLAIN
[StructLayout(LayoutKind.Sequential)]
#endif
sealed class Location
{
    internal readonly Point Current;

#if PLAIN
    private readonly Point _point0, _point1, _point2, _point3;
    private readonly Point _point4, _point5, _point6, _point7;

    internal ReadOnlySpan<Point> NeighborsPlace
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        get => MemoryMarshal.CreateReadOnlySpan(ref Unsafe.AsRef(in _point0), 8);
    }
#else
    internal readonly Point[] NeighborsPlace;
#endif

    internal Location(Point t)
    {
        Current = t;
        var (x, y) = t;
#if PLAIN
        _point0 = new(x - 1, y - 1);
        _point1 = new(x, y - 1);
        _point2 = new(x + 1, y - 1);
        _point3 = new(x - 1, y);
        _point4 = new(x + 1, y);
        _point5 = new(x - 1, y + 1);
        _point6 = new(x, y + 1);
        _point7 = new(x + 1, y + 1);
#else
        NeighborsPlace = new Point[]
        {
            new(x - 1, y - 1),
            new(x, y - 1),
            new(x + 1, y - 1),
            new(x - 1, y),
            new(x + 1, y),
            new(x - 1, y + 1),
            new(x, y + 1),
            new(x + 1, y + 1)
        };
#endif
    }
}