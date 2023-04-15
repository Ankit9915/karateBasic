package features;
import com.intuit.karate.junit5.Karate;

public class TestRunner {

	
	@Karate.Test
	Karate getApiTest() {
		return Karate.run("getApi").relativeTo(getClass());
	}
	@Karate.Test
	Karate postApiTest() {
		return Karate.run("postApi").relativeTo(getClass());
	}
	@Karate.Test
	Karate putApiTest() {
		return Karate.run("putApi").relativeTo(getClass());
	}
	@Karate.Test
	Karate deleteApiTest() {
		return Karate.run("deleteApi").relativeTo(getClass());
	}
	@Karate.Test
	Karate jsonApiTest() {
		return Karate.run("json").relativeTo(getClass());
	}
	@Karate.Test
	Karate updateUserApiTest() {
		return Karate.run("updateUser").relativeTo(getClass());
	}
}
