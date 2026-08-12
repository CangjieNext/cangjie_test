/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.*;
import java.io.*;

public class Generator {

    public static void main(String[] args) throws Exception {

        if (args.length != 2 && args.length != 3) {
            System.out.println("Usage: program size days [seed]");
            return;
        }

        final int planetSize = Integer.parseInt(args[0]);
        final int days = Integer.parseInt(args[1]);

        final int seed = (args.length == 3) ? Integer.parseInt(args[2]) : 1;
        final Random r = new Random(seed);

        Planet s = new Planet(planetSize, planetSize);
        for (int i = 0; i < planetSize; i++) {
            for (int j = 0; j < planetSize; j++) {
                if (r.nextFloat() * 10 < 4) {
                    Point t = new Point(i, j);
                    s.occupyPlace(t, new People(t));
                }
            }
        }

        try (FileOutputStream output = new FileOutputStream("data.txt"); PrintStream outputPrintStream = new PrintStream(output)) {
            outputPrintStream.printf("%d %d\n", planetSize, days);
            s.printGrid(outputPrintStream);
        }

    }
}
