package ir.saeidbabaei.saba.jwtauthentication.controller;

import java.util.HashSet;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ir.saeidbabaei.saba.bpms.BPMSProcessService;
import ir.saeidbabaei.saba.jwtauthentication.message.request.LoginForm;
import ir.saeidbabaei.saba.jwtauthentication.message.request.SignUpForm;
import ir.saeidbabaei.saba.jwtauthentication.message.response.JwtResponse;
import ir.saeidbabaei.saba.jwtauthentication.message.response.ResponseMessage;
import ir.saeidbabaei.saba.jwtauthentication.model.Role;
import ir.saeidbabaei.saba.jwtauthentication.model.RoleName;
import ir.saeidbabaei.saba.jwtauthentication.model.User;
import ir.saeidbabaei.saba.jwtauthentication.repository.RoleRepository;
import ir.saeidbabaei.saba.jwtauthentication.repository.UserRepository;
import ir.saeidbabaei.saba.jwtauthentication.security.jwt.JwtProvider;


@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
public class AuthRestAPIs {

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	UserRepository userRepository;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	PasswordEncoder encoder;

	@Autowired
	JwtProvider jwtProvider;
	
    @Autowired
    private BPMSProcessService bpmsprocessservice;
       
//    @Value("${server.port}")
//    private static String serverport;
//    
//    private static String uri = "http://localhost:" + serverport;

	@PostMapping("/signin")
	public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginForm loginRequest) {

		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

		SecurityContextHolder.getContext().setAuthentication(authentication);

		String jwt = jwtProvider.generateJwtToken(authentication);
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();

		return ResponseEntity.ok(new JwtResponse(jwt, userDetails.getUsername(), userDetails.getAuthorities()));
	}

    //***********In the next step use LDAP and Active Directory for both spring boot and BPMS users ***********
	//Confirmation of user must be implemented in the next step!!!!
	//All roles can register but must be approved by administrator. 
	@PostMapping("/signup")
	public ResponseEntity<?> registerUser(@Valid @RequestBody SignUpForm signUpRequest) {
		if (userRepository.existsByUsername(signUpRequest.getUsername())) {
			return new ResponseEntity<>(new ResponseMessage("Fail -> Username is already taken!"),
					HttpStatus.BAD_REQUEST);
		}

		if (userRepository.existsByEmail(signUpRequest.getEmail())) {
			return new ResponseEntity<>(new ResponseMessage("Fail -> Email is already in use!"),
					HttpStatus.BAD_REQUEST);
		}

		// Creating user's account
		User user = new User(signUpRequest.getName(), signUpRequest.getUsername(), signUpRequest.getEmail(),
				encoder.encode(signUpRequest.getPassword()));

		Set<String> strRoles = signUpRequest.getRole();
		Set<Role> roles = new HashSet<>();

		strRoles.forEach(role -> {
			switch (role) {
			case "ADMIN":
				Role adminRole = roleRepository.findByName(RoleName.ROLE_ADMIN)
						.orElseThrow(() -> new RuntimeException("Fail! -> Cause: User Role not find."));
				roles.add(adminRole);

				break;
			case "TECH":
				Role techRole = roleRepository.findByName(RoleName.ROLE_TECH)
						.orElseThrow(() -> new RuntimeException("Fail! -> Cause: User Role not find."));
				roles.add(techRole);

				break;
			case "FINANCE":
				Role financeRole = roleRepository.findByName(RoleName.ROLE_FINANCE)
						.orElseThrow(() -> new RuntimeException("Fail! -> Cause: User Role not find."));
				roles.add(financeRole);

				break;
			case "TELEPHONE":
				Role telephoneRole = roleRepository.findByName(RoleName.ROLE_TELEPHONE)
						.orElseThrow(() -> new RuntimeException("Fail! -> Cause: User Role not find."));
				roles.add(telephoneRole);

				break;				
			default:
				Role userRole = roleRepository.findByName(RoleName.ROLE_USER)
						.orElseThrow(() -> new RuntimeException("Fail! -> Cause: User Role not find."));
				roles.add(userRole);
			}
		});

		user.setRoles(roles);
		userRepository.save(user);
		
		//Insert BPMS user and membership
		bpmsprocessservice.addbpmsuser(user);
        
		strRoles.forEach(role -> {				
			bpmsprocessservice.addbpmsusertogroup(role, user.getUsername());
		});
		

		return new ResponseEntity<>(new ResponseMessage("User registered successfully!"), HttpStatus.OK);
	}
}