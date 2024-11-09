package examples.pruebas;

import com.intuit.karate.junit5.Karate;

public class PruebasRunner {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("prueba").relativeTo(getClass());
    }
}
