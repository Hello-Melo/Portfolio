package sh.hoon.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;



@Configuration
@EnableWebSecurity
@Import(value= {SecurityBean.class})
@ComponentScan("sh.hoon.security")
public class SecurityConfig  extends WebSecurityConfigurerAdapter {

	@Autowired
	AuthenticationSuccessHandler loginSuccessHandler;
	
	@Autowired
	UserDetailsService detailsService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/security/all").permitAll()
				.antMatchers("/security/member").access("hasRole('MEMBER')")
				.antMatchers("/security/admin").access("hasRole('ADMIN')");
		
		http.formLogin()
				.usernameParameter("loginEmail")
				.passwordParameter("loginPw")
				.loginPage("/login")
				.loginProcessingUrl("/member/login")
				.successHandler(loginSuccessHandler);
		
		http.logout()
				.logoutUrl("/member/logout")
				.invalidateHttpSession(true)
				.deleteCookies("E-mail기억하기", "JSESSION_ID");
		
	}	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		//auth.inMemoryAuthentication().withUser("admin").password("{noop}1234").roles("ADMIN");
		//auth.inMemoryAuthentication().withUser("memeber").password("{noop}1234").roles("MEMBER");
		
		auth.userDetailsService(detailsService).passwordEncoder(bcrayptPwEncoder());
	}
	
	@Bean
	public PasswordEncoder bcrayptPwEncoder() {
		return new BCryptPasswordEncoder();
	}
}
