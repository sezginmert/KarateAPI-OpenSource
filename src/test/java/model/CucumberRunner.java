import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import static java.lang.Integer.parseInt;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CucumberRunner {

    @Test
    void testAll() {
        // mvn clean test -Dtest="CucumberRunner#testAll" -DbuildNumber=4445
        // run command line:  mvn test -Dtest="CucumberRunner#testAll"
        // mvn clean test -Dtest="CucumberRunner#testAll" -Dkarate.options="--tags @regression"
        List<String> tagList = Arrays.asList("~@excluded", "~@wip");
        Results results = Runner.path("classpath:features").tags(tagList).outputCucumberJson(true).parallel(0);
        generateReport(results.getReportDir());
    }

    @Test
    void testSmoke() {
        //run command line:  mvn test -Dtest="CucumberRunner#testSmoke"
        List<String> tagList = Arrays.asList("@smoke", "~@excluded", "~@wip");
        Results results = Runner.path("classpath:features").tags(tagList).outputCucumberJson(true).parallel(0);
        generateReport(results.getReportDir());
    }

    @Test
    void testParallel() {
        // run command line: mvn clean test -Dtest="CucumberRunner#testParallel" "-Dkarate.options=--tags @smoke" -Dcount=10
        String threadCount = System.getProperty("count");
        List<String> tagList = Arrays.asList("~@excluded", "~@wip");
        int count = (threadCount == null) ? 5 : parseInt(threadCount);
        Results results = Runner.path("classpath:features").tags(tagList).outputCucumberJson(true).parallel(count);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "karateWebinar");
        //config.setBuildNumber("4444");
        config.setBuildNumber(System.getProperty("buildNumber"));
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();

    }
}