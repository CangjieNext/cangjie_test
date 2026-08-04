/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package xml;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkXmlParser {
    @Param(value = {"512", "4096", "32768"})
    static Integer attrNum;

    @Param(value = {"2", "8", "32"})
    static Integer depth;

    @Param(value = {"512", "4096", "32768"})
    static Integer nodeNum;

    static String filename;
    static File file;

    @Setup(Level.Iteration)
    public void setup() {
        String workSpace = System.getenv("BENCHROOT");
        filename = workSpace + "/../../java/xml/xml" + "A" + attrNum + "D" + depth + "N" + nodeNum + ".xml";
        file = new File(filename);
    }
    @Benchmark
    public void BenchmarkXmlParser() throws ParserConfigurationException, IOException, SAXException {
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
        Document document = documentBuilder.parse(file);
        document.getDocumentElement().normalize();
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkXmlParser.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
