package com.loginregister.and.todoapp.demo.authentications;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.List;

public class Auth {
    public static boolean save(Object obj){
        List<GrantedAuthority> authorities = Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER"));

        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(obj, "password", authorities);
        SecurityContextHolder.getContext().setAuthentication(token);

        return !isAnonymous();
    }

    public static Authentication current() {
        return SecurityContextHolder.getContext().getAuthentication();
    }

    public static boolean isAnonymous(){
        if (current() != null) {
            return current().getPrincipal().equals("anonymousUser");
        }
        return true;
    }

    public static boolean logout(HttpServletRequest request, HttpServletResponse response){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return isAnonymous();
    }
}
