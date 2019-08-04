package ir.saeidbabaei.saba;

//import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
//import org.springframework.context.annotation.Bean;
//import org.activiti.engine.IdentityService;
//import org.activiti.engine.identity.Group;
//import org.activiti.engine.identity.User;
import org.activiti.spring.boot.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class StaticWebApplication extends SpringBootServletInitializer {

    public static void main(String[] args) throws Exception {
        SpringApplication.run(StaticWebApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(getClass());
    }

//Insert Activiti user -- No need to add activiti user,group,membership since we use our users and roles
//      @Bean
//      InitializingBean usersAndGroupsInitializer(final IdentityService identityService) {
//  
//          return new InitializingBean() {
//              public void afterPropertiesSet() throws Exception {
//  
//                  Group group = identityService.newGroup("USER");
//                  group.setName("users");
//                  group.setType("security-role");
//                  identityService.saveGroup(group);
//                  
//                  User user = identityService.newUser("user1");
//                  user.setPassword("$2a$10$u9Ap4nsf2UH3QV8JA..EcO0/R01JVlqB0fczZzn/oQCDouHBIkMMS");
//                  identityService.saveUser(user);
//                  
//                  identityService.createMembership("user1", "USER");
//                  
//                  //
//                  
//                  Group group1 = identityService.newGroup("ADMIN");
//                  group1.setName("admins");
//                  group1.setType("security-role");
//                  identityService.saveGroup(group1);
//                  
//                  User user1 = identityService.newUser("admin");
//                  user1.setPassword("$2a$10$u9Ap4nsf2UH3QV8JA..EcO0/R01JVlqB0fczZzn/oQCDouHBIkMMS");
//                  identityService.saveUser(user1);
//                  
//                  identityService.createMembership("admin", "ADMIN");
//                  
//                  //
//                  
//                  Group group2 = identityService.newGroup("TECH");
//                  group2.setName("techs");
//                  group2.setType("security-role");
//                  identityService.saveGroup(group2);
//                  
//                  User user2 = identityService.newUser("tech1");
//                  user2.setPassword("$2a$10$u9Ap4nsf2UH3QV8JA..EcO0/R01JVlqB0fczZzn/oQCDouHBIkMMS");
//                  identityService.saveUser(user2);
//                  
//                  identityService.createMembership("tech1", "TECH");
//                  
//                  //
//                  
//                  Group group3 = identityService.newGroup("FINANCE");
//                  group3.setName("finances");
//                  group3.setType("security-role");
//                  identityService.saveGroup(group3);
//                  
//                  User user3 = identityService.newUser("finance1");
//                  user3.setPassword("$2a$10$u9Ap4nsf2UH3QV8JA..EcO0/R01JVlqB0fczZzn/oQCDouHBIkMMS");
//                  identityService.saveUser(user3);
//                  
//                  identityService.createMembership("finance1", "FINANCE");
//                  
//                  //
//                  
//                  Group group4 = identityService.newGroup("TELEPHONE");
//                  group4.setName("telephones");
//                  group4.setType("security-role");
//                  identityService.saveGroup(group4);
//  
//
//                  User user4 = identityService.newUser("telephone1");
//                  user4.setPassword("$2a$10$u9Ap4nsf2UH3QV8JA..EcO0/R01JVlqB0fczZzn/oQCDouHBIkMMS");
//                  identityService.saveUser(user4);
//                  
//                  identityService.createMembership("telephone1", "TELEPHONE");
//
//  
//              }
//          };
//      }
    
}
