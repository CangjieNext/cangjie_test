/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package server_http;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;

public class BenchmarkHttpServer {
    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(62001), 0);
        int[] bodySizes = {32, 256, 2048, 16384, 131072, 1048576, 8388608, 67108864};
        for (int bodySize : bodySizes) {
            server.createContext("/get" + bodySize, new GetHandler(bodySize));
        }
        server.createContext("/post", new GetHandler(0));
        server.setExecutor(null);
        server.start();
    }

    static class GetHandler implements HttpHandler {
        private final int size;

        public GetHandler(int size) {
            this.size = size;
        }

        public void handle(HttpExchange t) throws IOException {
            String response = new String(new int [size], 0, size).replace('\0', 'a');
            t.getRequestMethod();
            t.getRequestBody();
            t.sendResponseHeaders(200, response.length());
            OutputStream os = t.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }
}
