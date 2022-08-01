package sh.hoon.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import sh.hoon.mapper.MemberMapper;
import sh.hoon.model.MemberVO;

@Service
public class HoonUesrDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
		System.out.println("ddddddddddddddddddddddddddddddddd");
		System.out.println("유저 정보 확인 by uername : " + userEmail);
		MemberVO vo = mapper.findByEmail(userEmail); 
		return vo != null ? new HoonUser(vo) : null ;
	}

}
