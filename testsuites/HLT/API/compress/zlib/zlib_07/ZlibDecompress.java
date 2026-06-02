/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;

public class ZlibDecompress {
    public static void decompress(String address) {
        BufferedReader br = null;
        BufferedWriter bw = null;
        try {
            br = new BufferedReader(new InputStreamReader(
                    new InflaterInputStream(new FileInputStream(new File(address)), new Inflater(true))));
            String fileName = address.replaceAll("Compress", "Compress_javaDe.txt");
            bw = new BufferedWriter(new FileWriter(new File(fileName)));
            String tempString = null;
            while ((tempString = br.readLine()) != null) {
                System.out.println(tempString);
                bw.write(tempString);
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (bw != null) {
                try {
                    bw.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void main(String[] args) throws IOException {
        ZlibDecompress.decompress(args[0]);
    }
}