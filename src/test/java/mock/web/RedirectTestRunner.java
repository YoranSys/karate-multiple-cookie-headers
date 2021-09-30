package mock.web;

import com.intuit.karate.Runner;
import org.junit.Test;

/**
 *
 * @author pthomas3
 */
public class RedirectTestRunner {
    
    @Test
    public void testMockOnPort8080() {
        Runner.runFeature(getClass(), "redirect-test.feature", null, false);
    }

}
