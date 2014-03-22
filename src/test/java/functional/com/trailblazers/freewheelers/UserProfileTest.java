package functional.com.trailblazers.freewheelers;

import org.junit.Test;
import static functional.com.trailblazers.freewheelers.helpers.SyntaxSugar.*;

public class UserProfileTest extends UserJourneyBase {

    @Test
    public void testViewUserProfile() throws Exception {
        String jan = "Jan Plewka";

        admin
                .there_is_no_account_for(jan);

        user
                .is_logged_out()
                .creates_an_account(jan, SOME_EMAIL, SOME_PASSWORD, SOME_PHONE_NUMBER, SOME_COUNTRY)
                .logs_in_with(jan, SOME_PASSWORD);
        screen
                .shows_in_navbar("Welcome " + jan);
        user
                .visits_his_profile();
        screen
                .show_his_profile_with_country(SOME_COUNTRY);

    }
}
