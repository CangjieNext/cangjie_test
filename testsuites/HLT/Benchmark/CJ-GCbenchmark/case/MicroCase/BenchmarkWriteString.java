/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import com.google.gson.stream.JsonWriter;

import java.io.*;
import java.util.Random;
import java.util.concurrent.TimeUnit;

public class BenchmarkWriteString {
    static JsonWriter jsonWriter = new JsonWriter(new OutputStreamWriter(new ByteArrayOutputStream()));
    static int[] paramValues = {16, 64, 256};
    static int[] reps = {100000, 10000, 10000};

    public static void testWriteStrings(JsonWriter jw, int n, String string) throws IOException {
        jw.beginArray();
        for (int i = 0;i < n; i++) {
            jsonWriter.value(string);
        }
        jsonWriter.endArray();
        jsonWriter.flush();
    }

    public static String buildList(int size) throws IOException {
        String characters = "aBcD"; // 可选的字符集合
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(characters.charAt(i % 4));
        }
        return sb.toString();
    }

    public static JsonWriter getWriter() throws IOException {
        return jsonWriter = new JsonWriter(new OutputStreamWriter(new ByteArrayOutputStream()));
    }


    public static void timeBenchmarkJsonWriteString(int size, int n) throws IOException {

        var jw = getWriter();
        var string = buildList(size);
        testWriteStrings(jw, n, string);
    }

    public static void main(String[] args) throws IOException {
        var startTime = System.nanoTime();
        for (int i = 0; i < 3; i++) {
            timeBenchmarkJsonWriteString(paramValues[i], reps[i]);
        }
        var perTime = System.nanoTime() - startTime;
        System.out.println("BenchmarkWriteString: ms = " + perTime / 1000000.0);
        return;
    }
}
