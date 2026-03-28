import test.EchoImpl;

public class Main {
    public static void main(String[] args) {
        EchoImpl impl = new EchoImpl();
        long res = impl.callJava();
        System.out.println("ret from JavaImpl = " + res);

        EchoImpl impl2 = new EchoImpl();
        res = impl2.callJavaWithSpawn();
        System.out.println("ret from JavaImpl with spawn = " + res);
    }
}

