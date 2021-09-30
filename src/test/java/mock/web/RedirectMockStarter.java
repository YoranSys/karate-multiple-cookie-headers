package mock.web;

import com.intuit.karate.core.MockServer;
import org.junit.Test;

/**
 *
 * @author pthomas3
 */
public class RedirectMockStarter {

    @Test
    public void beforeClass() {
        MockServer server = MockServer.feature("classpath:mock/web/redirect-mock.feature").http(8080).build();
        server.waitSync();
    }

}
