/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
sealed class Planet
{
    private readonly int _sizeX;
    private readonly int _sizeY;
#if VERBOSE
    private int _day = 1;
#endif

    private People?[][] _towns;

    internal Planet(int sizeX, int sizeY)
    {
        _sizeX = sizeX;
        _sizeY = sizeY;
        _towns = new People?[sizeX][];
        for (var i = 0; i < _towns.Length; i++) 
        {
            _towns[i] = new People?[sizeY];
        }
    }

    internal ref People? this[Point p] => ref _towns[p.X][p.Y];

#if VERBOSE
    internal void Information()
    {
        Console.WriteLine($"Day: {_day}");
        PrintGrid();
    }

    void PrintGrid()
    {
        Console.Write('+');

        for (var x = 0; x < _sizeY; x++)
        {
            Console.Write('-');
        }

        Console.WriteLine('+');

        for (var y = 0; y < _sizeY; y++)
        {
            Console.Write('|');

            for (var x = 0; x < _sizeX; x++)
            {
                Console.Write(_towns[x][y] is not null ? '*' : ' ');
            }

            Console.WriteLine('|');
        }

        Console.Write('+');
        for (var x = 0; x < _sizeX; x++)
        {
            Console.Write('-');
        }

        Console.Write('+');
    }
#endif

    internal void NewDay()
    {
        Planet ns = new(_sizeX, _sizeY);

        foreach (var row in _towns)
        {
            foreach (var cell in row)
            {
                cell?.Reproduction(this, ns, cell);
            }
        }

        _towns = ns._towns;
#if VERBOSE
        _day++;
#endif
    }

    internal bool OnPlanet(Point t)
    {
        var x = t.X;
        var y = t.Y;
        return x >= 0 && x < _sizeX && y >= 0 && y < _sizeY;
    }

    internal int Survivors()
    {
        var result = 0;

        foreach (var row in _towns)
        {
            foreach (var cell in row)
            {
                if (cell is not null)
                {
                    result++;
                }
            }
        }

        return result;
    }
}