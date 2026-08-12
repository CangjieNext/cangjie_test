/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
sealed class People
{
    private readonly Location _place;

    internal People(Point t) => _place = new Location(t);

    private static int CountCommunity(Planet planet, People t)
    {
        var count = 0;

        foreach (var friend in t._place.NeighborsPlace)
        {
            if (planet.OnPlanet(friend) && planet[friend] is not null)
            {
                count++;
            }
        }

        return count;
    }

    internal void Reproduction(Planet oldPlanet, Planet newPlanet, People t)
    {
        var n = CountCommunity(oldPlanet, t);

        if (n is > 1 and < 4 && newPlanet[t._place.Current] is null)
        {
            newPlanet[t._place.Current] = this;
        }

        foreach (var neighborPlace in t._place.NeighborsPlace)
        {
            People friend = new(neighborPlace);

            if (newPlanet.OnPlanet(friend._place.Current) && newPlanet[friend._place.Current] is null &&
                CountCommunity(oldPlanet, friend) == 3)
            {
                newPlanet[friend._place.Current] = new People(friend._place.Current);
            }
        }
    }
}