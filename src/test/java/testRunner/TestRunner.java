package testRunner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    // Sadece @smoke etiketi ile işaretlenmiş testleri çalıştırır
    @Karate.Test
    public Karate testSmoke() {
        return Karate.run("classpath:feature").tags("@smoke");
    }

    // Sadece @regression etiketi ile işaretlenmiş testleri çalıştırır
    @Karate.Test
    public Karate testRegression() {
        return Karate.run("classpath:feature").tags("@regression");
    }

    // @smoke etiketi olmayan testleri çalıştırır
    @Karate.Test
    public Karate testWithoutSmoke() {
        return Karate.run("classpath:feature").tags("~@smoke");
    }

    // Tüm testleri çalıştırır
    @Karate.Test
    public Karate testAll() {
        return Karate.run("classpath:feature");
    }
}
