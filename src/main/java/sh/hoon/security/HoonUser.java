package sh.hoon.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.Setter;
import sh.hoon.model.MemberVO;

@Getter
@Setter
public class HoonUser extends User {
	
	private static final long serialVersionUID = -3096473734948935272L;

	private MemberVO memberVO;
	
	public HoonUser(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}

	public HoonUser(MemberVO memberVo) {
		super(memberVo.getUserEmail(), memberVo.getUserPw(),
				memberVo.getAuthList().stream().map(vo -> new SimpleGrantedAuthority(vo.getAuth()))
				.collect(Collectors.toList())
				);
		System.out.println("User 생성");
		this.memberVO = memberVo;
		System.out.println(memberVo.getAuthList().toString());
		//autoVO -> SimplegreatedAutrity로 변환
	}

}
