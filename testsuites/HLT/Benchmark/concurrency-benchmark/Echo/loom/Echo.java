/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.net.StandardSocketOptions;
import java.nio.ByteBuffer;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.CountDownLatch;

public class Echo {

    final int BYTE_ARR_SIZE = 16;
    final byte[] initialMsg;

    final int connections;
    final int iters;

    final ArrayList<Runnable> tasks;
    final CountDownLatch latch;
    final int port;

    Echo(int connections, int iters, int port) {
        initialMsg = new byte[BYTE_ARR_SIZE];
        for (int i = 0; i < BYTE_ARR_SIZE; ++i) {
            initialMsg[i] = (byte) i;
        }

        this.connections = connections;
        this.iters = iters;
        this.tasks = new ArrayList<>(connections);
        this.latch = new CountDownLatch(connections);
        this.port = port;
    }

    void startAndWait() {
        final SocketAddress address = new InetSocketAddress(port);
        try (ServerSocketChannel server = ServerSocketChannel.open()
                .setOption(StandardSocketOptions.SO_REUSEADDR, true)
                .bind(address, 2048))
        {
            final var ser = Thread.startVirtualThread(suppressed(() -> {
                for (int i = 0; i < connections; ++i) {
                    var conn = server.accept();
                    conn.setOption(StandardSocketOptions.TCP_NODELAY, true);
                    var buf = ByteBuffer.wrap(Arrays.copyOf(initialMsg, BYTE_ARR_SIZE));
                    buf.put(initialMsg);
                    tasks.add(suppressed(() -> {
                        for (int j = 0; j < iters; ++j) {
                            conn.write(buf.flip());
                            int m = conn.read(buf.clear());
                            if (m != BYTE_ARR_SIZE) {
                                throw new RuntimeException("verification failed");
                            }
                        }
                        conn.close();
                        verify(buf);
                        latch.countDown();
                    }));
                }
                server.close();
            }));

            final CountDownLatch stop = new CountDownLatch(connections);

            for (int i = 0; i < connections; ++i) {
                try(final SocketChannel conn = SocketChannel.open()
                        .setOption(StandardSocketOptions.TCP_NODELAY, true);){
                
                boolean success = conn.connect(address);
                assert success;

                final var buf = ByteBuffer.wrap(Arrays.copyOf(initialMsg, BYTE_ARR_SIZE));
                Thread.startVirtualThread(suppressed(() -> {
                    for (int j = 0; j < iters; ++j)  {
                        int m = conn.read(buf.clear());
                        if (m != BYTE_ARR_SIZE) {
                            throw new RuntimeException("verification failed");
                        }
                        conn.write(buf.flip());
                    }
                    conn.close();
                    stop.countDown();
                }));
            }
            }

            ser.join();

            final long start = System.currentTimeMillis();
            tasks.forEach(Thread::startVirtualThread);

            latch.await();
            final long end = System.currentTimeMillis();
            System.out.println("Time: " + (end - start));

            stop.await();
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
    }

    interface IOExceptionRunnable {
        void run() throws IOException;
    }

    static Runnable suppressed(IOExceptionRunnable runnable) {
        return () -> {
            try {
                runnable.run();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        };
    }

    void verify(ByteBuffer buffer) {
        byte[] array = buffer.array();
        for (int i = 0; i < BYTE_ARR_SIZE; ++i) {
            if (array[i] != initialMsg[i]) {
                throw new RuntimeException("error compare");
            }
        }
    }

    static int nIter = 10000;
    static int nConn = 100;

    static void parseArgs(String args[]) throws Exception {
        for (int pos = 0; pos < args.length; pos +=2 ) {
            String option = args[pos];
            int value = Integer.parseInt(args[pos + 1]);

            if (value <= 0)
                throw new Exception();

            if (option.equals("-iter")) {
                nIter = value;
            } else if (option.equals("-connections")) {
                nConn = value;
            } else
                throw new Exception();
        }
    }


    public static void main(String[] args) {
        try {
            parseArgs(args);
        } catch (Exception e) {
            System.out.println("Usage: [-iter <num>] [-connections <num>]");
            System.out.println("");
            System.exit(1);
        }

        new Echo(100, 10000, 27015).startAndWait(); // warmup
        new Echo(nConn, nIter, 27016).startAndWait();
    }
}
