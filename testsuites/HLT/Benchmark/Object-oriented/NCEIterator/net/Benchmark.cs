/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
using System.Diagnostics;

internal static class Benchmark
{
    private const ulong Modulo = 9223372036854775783;

    public static ulong CheckableCount;
    public static ulong CallCount;
    public static ulong NonCascadingCount;
    public static ulong NonCheckableMarkedCount;
    private static bool _result;
    private static uint _repeatCount = 3;
    private static ulong _itemCount = 500;
    private static ulong _iterationCount = 1000000;

    public static bool NextBoolean(this Random random)
    {
        return random.Next() < int.MaxValue / 2;
    }

    public static void Run(string[] args)
    {
        switch (args.Length)
        {
            case < 1 or > 3:
                Console.WriteLine("Usage: program <repeats> [items] [iterations]");
                Console.WriteLine($"   where default value of items is {_itemCount}");
                Console.WriteLine($"     and default value of iterations is {_iterationCount}");
                return;
            case 3:
                _iterationCount = ulong.Parse(args[2]);
                goto case 2;
            case 2:
                _itemCount = ulong.Parse(args[1]);
                goto case 1;
            case 1:
                _repeatCount = uint.Parse(args[0]);
                break;
        }

        List<M_A> mAVec = new();
        for (ulong i = 0; i < _itemCount; i++)
        {
            if (i % 20 == 0)
            {
                mAVec.Add(new N_A_A_A());
            }
            else if (i % 2 == 0)
            {
                mAVec.Add(new M_A_A_C());
            }
            else if (i % 3 == 0)
            {
                mAVec.Add(new M_A_A_B());
            }
            else
            {
                mAVec.Add(new M_A_A_A());
            }
        }

        var expected = Verify(_iterationCount, mAVec);

        for (uint i = 0; i < _repeatCount; i++)
        {
            Measure(expected, mAVec);
        }
    }

    private static void Measure(ulong expected, List<M_A> mAVec)
    {
        ulong actual = 0;
        ulong actualMarkedCount = 0;
        // Benchmark itself
        Console.Write("Benchmark started...");
        Console.Out.Flush();
        var start = Stopwatch.GetTimestamp();

        bool status;
        for (ulong i = 0; i < _iterationCount; i++)
        {
            foreach (var maElement in mAVec)
            {
                status = maElement.Cascading;
                if (status)
                {
                    status = status && maElement.Constrained;
                    if (status)
                    {
                        // we have these two property calls to get an additional virtual call (the target of this benchmark)
                        _result = maElement.Kind == Method;
                        _result = maElement.Kind == Property;
                        if (_result)
                        {
                            actual = (actual << 1 | 1) % Modulo;
                        }
                        else
                        {
                            actual = (actual << 1) % Modulo;
                        }
                    }
                    else
                    {
                        if (maElement is N { IsMarked: true })
                        {
                            actualMarkedCount++;
                        }
                    }
                }
            }
        }

        var time = Stopwatch.GetElapsedTime(start).TotalMilliseconds;
        var result = actual ^ actualMarkedCount;
        if (result == expected)
        {
            Console.WriteLine($" done. Total time: {time:F0} ms");
        }
        else
        {
            Console.WriteLine($" failed in {time:F0} ms: expected {expected}, actual {result}.");
        }
    }

    private static ulong Verify(ulong iterations, List<M_A> mAVec)
    {
        ulong expected = 0;
        ulong cascadingMarkedCount = 0;
        ulong nonCascadingMarkedCount = 0;
        ulong nonCheckableNCount = 0;

        if (_itemCount != checked((ulong)mAVec.Count))
        {
            throw new Exception("Wrong item count");
        }

        for (ulong i = 0; i < iterations; i++)
        {
            ulong checkedCount = 0;

            foreach (var (maElement, j) in mAVec.Select((x, i) => (x, i)))
            {
                if (maElement is { CascadingVerified: true, ConstrainedVerified: true })
                {
                    _result = maElement.KindVerified switch
                    {
                        Property => j % 2 == 0,
                        Method => j % 2 != 0 && j % 3 == 0,
                        Bean => j % 20 == 0 || j % 2 != 0 && j % 3 != 0,
                        _ => false
                    };

                    if (!_result)
                    {
                        throw new Exception("Wrong kind");
                    }

                    checkedCount++;

                    _result = maElement.KindVerified switch
                    {
                        Bean when j % 20 == 0 || j % 2 != 0 && j % 3 != 0 => false,
                        Method when j % 2 != 0 && j % 3 == 0 => false,
                        Property when j % 2 == 0 => false,
                        _ => true
                    };

                    if (_result)
                    {
                        throw new Exception("Wrong kind");
                    }

                    checkedCount++;

                    if (j % 20 != 0 && j % 2 == 0)
                    {
                        expected = (expected << 1 | 1) % Modulo;
                    }
                    else
                    {
                        expected = (expected << 1) % Modulo;
                    }
                }
                else
                {
                    if (maElement is N)
                    {
                        nonCheckableNCount++;
                    }

                    var increment = ComputeMarkedIncrement(maElement);

                    if ((increment != 0) && (increment != 1))
                    {
                        throw new Exception("Wrong increment");
                    }

                    // Assert that (increment == 1) => (j % 20 == 0)
                    if ((increment != 0) && (j % 20 != 0))
                    {
                        throw new Exception("Wrong element");
                    }

                    if (maElement.CascadingVerified)
                    {
                        cascadingMarkedCount += increment;
                    }
                    else
                    {
                        nonCascadingMarkedCount += increment;
                    }
                }
            }

            if (checkedCount != CheckableCount * 2)
            {
                throw new Exception("Wrong checked count");
            }
        }

        if (CheckableCount > _itemCount)
        {
            throw new Exception("Wrong checkable count");
        }

        if (NonCascadingCount > _itemCount)
        {
            throw new Exception("Wrong non-cascading count");
        }

        if (CallCount != nonCheckableNCount + iterations * (NonCascadingCount + (_itemCount - NonCascadingCount) * 2 +
                                                            CheckableCount * 2 + (_itemCount - CheckableCount)))
        {
            throw new Exception("Wrong call count");
        }

        if (cascadingMarkedCount + nonCascadingMarkedCount > nonCheckableNCount)
        {
            throw new Exception("Wrong non-checkable marked count");
        }

        if (cascadingMarkedCount + nonCascadingMarkedCount != iterations * NonCheckableMarkedCount)
        {
            throw new Exception("Wrong non-checkable marked count");
        }

        if (cascadingMarkedCount > iterations * (_itemCount - NonCascadingCount))
        {
            throw new Exception("Wrong cascading marked count");
        }

        if (nonCascadingMarkedCount > iterations * NonCascadingCount)
        {
            throw new Exception("Wrong non-cascading marked count");
        }

        return expected ^ cascadingMarkedCount;

        static ulong ComputeMarkedIncrement(M_A maElement) => maElement switch
        {
            N { IsMarkedVerified: true } => 1,
            _ => 0
        };
    }
}