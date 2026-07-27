/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.*;
import java.io.*;

class Point {

    public int x;
    public int y;

    Point(int x1, int y1) {
        x = x1;
        y = y1;
    }
}

class Location {

    public Point current;

    static final int neighbors = 8;

    public Point[] neighbors_place;

    Location(Point t) {
        current = t;
        neighbors_place = new Point[] {
                new Point(t.x - 1, t.y - 1),
                new Point(t.x, t.y - 1),
                new Point(t.x + 1, t.y - 1),
                new Point(t.x - 1, t.y),
                new Point(t.x + 1, t.y),
                new Point(t.x - 1, t.y + 1),
                new Point(t.x, t.y + 1),
                new Point(t.x + 1, t.y + 1)
        };
    }

}

class People {

    public Location place;

    People(Point t) {
        place = new Location(t);
    }

    char information() {
        return '*';
    }

    private int count_community(Planet s, People t) {
        int count = 0;

        for (int i = 0; i < Location.neighbors; i++) {
            Point friend = t.place.neighbors_place[i];
            if (s.onPlanet(friend) && s.checkPopulation(friend) != null) {
                count++;
            }
        }
        return count;
    }

    void reproduction(Planet s, Planet ns, People t) {
        int n = count_community(s, t);

        if (n > 1 && n < 4 && ns.checkPopulation(t.place.current) == null) {
            ns.occupyPlace(t.place.current, this);
        }

        for (int i = 0; i < Location.neighbors; i++) {
            People friend = new People(t.place.neighbors_place[i]);

            if (ns.onPlanet(friend.place.current) && ns.checkPopulation(friend.place.current) == null && count_community(s, friend) == 3) {
                ns.occupyPlace(friend.place.current, new People(friend.place.current));
            }
        }
    }
}

class Planet {

    private int sizeX;
    private int sizeY;
    private int day; // = 0;

    private People[][] towns;

    Planet(int sizeX, int sizeY) {
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        towns = new People[sizeX][sizeY];
        day = 1;
    }

    void occupyPlace(Point t, People men) {
        towns[t.x][t.y] = men;
    }


    People checkPopulation(Point t) {
        return towns[t.x][t.y];
    }

    void information(boolean verbose, PrintStream out) {
        if (verbose) {
            out.println("Day: " + day);
            printGrid(out);
        }
    }

    void printGrid(PrintStream out) {
        out.print("+");

        for (int x = 0; x < sizeY; x++) {
            out.print("-");
        }

        out.println("+");

        for (int y = 0; y < sizeY; y++) {
            out.print("|");

            for (int x = 0; x < sizeX; x++) {
                if (towns[x][y] != null) {
                    out.print(towns[x][y].information());
                } else {
                    out.print(" ");
                }
            }

            out.println("|");
        }

        out.print("+");
        for (int x = 0; x < sizeX; x++) {
            out.print("-");
        }

        out.print("+");
    }

    void newDay() {
        Planet ns = new Planet(sizeX, sizeY);

        for (int y = 0; y < sizeY; y++) {
            for (int x = 0; x < sizeX; x++) {
                if (towns[x][y] != null) {
                    People p = towns[x][y];
                    checkPopulation(p.place.current).reproduction(this, ns, p);
                }
            }
        }

        towns = ns.towns;
        day++;
    }

    boolean onPlanet(Point t) {
        return t.x >= 0 && t.y >= 0 && t.x < sizeX && t.y < sizeY;
    }

    int survivors() {
        int result = 0;
        for (int i = 0; i < sizeX; i++) {
            for (int j = 0; j < sizeY; j++) {
                if (towns[i][j] != null) {
                    result++;
                }
            }
        }
        return result;
    }

}

public class GameOfLife {

    static boolean verbose = false;

    public static void measure() throws Exception {
        int planetSize;
        int days;
        Planet s;

        // Initialization

        try (FileInputStream input = new FileInputStream("data.txt")) {
            try (Scanner scanner = new Scanner(input)) {
                planetSize = scanner.nextInt();
                s = new Planet(planetSize, planetSize);

                days = scanner.nextInt();

                String str = scanner.nextLine();
                str = scanner.nextLine();

                for (int i = 0; i < planetSize; i++) {
                    String currentString = scanner.nextLine();
                    for (int j = 1; j < planetSize + 1; j++) {
                        char currentChar = currentString.charAt(j);
                        if (currentChar == '*') {
                            Point t = new Point(i, j - 1);
                            s.occupyPlace(t, new People(t));
                        }
                    }
                }
            }
        }

        System.out.printf("Starting a simulation for %d days\n", days);

        // Benchmark itself
        final long start = System.nanoTime();

        for (int i = 0; i < days; i++) {
            s.information(verbose, System.out);
            s.newDay();
        }

        final long end = System.nanoTime();
        System.out.printf("Total time: %.0f ms\n", (end - start) / 1000000.0);
        System.out.println("Survivors after simulation: " + s.survivors());

        if (verbose) {
            // Printing of final state
            s.printGrid(System.out);
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 1) {
            System.out.println("Usage: program <repeats>");
            return;
        }

        final int R = Integer.parseInt(args[0]);
        for (int i = 0; i < R; i++) {
            measure();
        }
    }
}
