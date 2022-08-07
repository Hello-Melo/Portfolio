package sh.hoon.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import sh.hoon.security.HoonAccessDeniedHandler;


@Configuration
@EnableWebSecurity
@Import(value = {SecurityBean.class})
@ComponentScan("sh.hoon.security")
public class SecurityConfig  extends WebSecurityConfigurerAdapter {

	@Autowired
	AuthenticationSuccessHandler loginSuccessHandler;
	
	@Autowired
	UserDetailsService detailsService;
	
	@Autowired
	PasswordEncoder encoder;

	@Autowired
	PersistentTokenRepository persistentTokenRepository;
	
	@Autowired
	AuthenticationFailureHandler failureHandler;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("utf-8");
		filter.setForceEncoding(true);
		http.addFilterBefore(filter, CsrfFilter.class);
		
		http.authorizeRequests()
				.antMatchers("/security/all").permitAll()
				.antMatchers("/security/member").access("hasRole('ROLE_MEMBER')")
				.antMatchers("/security/admin").access("hasRole('ROLE_ADMIN')");
		
		http.formLogin()
				.usernameParameter("loginEmail")
				.passwordParameter("loginPw")
				.loginPage("/login")
				.loginProcessingUrl("/member/login")
				.successHandler(loginSuccessHandler)
				.failureHandler(failureHandler); 
		
		http.logout()
				.logoutUrl("/logout")
				.invalidateHttpSession(true)
				.deleteCookies("remember-me", "JSESSION_ID");
		
		http.rememberMe().key("project").tokenRepository(persistentTokenRepository)
				.tokenValiditySeconds(604800);
		
		http.exceptionHandling()
		.accessDeniedHandler( new HoonAccessDeniedHandler());
		
		http.csrf().ignoringAntMatchers("/uploadAjaxAction", "/deleteFile", "/adm/fileupload.do", 
				"/replies/**", "/member/approve", "/member/deni", "/member/drop");
		
	}	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		//auth.inMemoryAuthentication().withUser("admin").password("{noop}1234").roles("ADMIN");
		//auth.inMemoryAuthentication().withUser("memeber").password("{noop}1234").roles("MEMBER");
		
		auth.userDetailsService(detailsService).passwordEncoder(encoder);
	}
	

}
