package com.nci.petkeepers.controller;

import com.nci.petkeepers.model.Users;
import com.nci.petkeepers.repository.UsersRepository;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/nci")
public class HomeController {
    @Autowired
    UsersRepository usersRepository;

    @GetMapping("/getAll")
    @ResponseBody
    public List<Users> getByName(){

        return usersRepository.findAll();
    }

    @GetMapping("/getByUsername/{username}")
    @ResponseBody
    public Users getByUsername(@PathVariable String username){
        return usersRepository.findByUsername(username);
    }

    @GetMapping("/getByUsertype/{usertype}")
    @ResponseBody
    public List<Users> getByUsertype(@PathVariable String usertype){
        return usersRepository.findByUsertype(usertype);
    }

    @PostMapping("/saveAll")
    @ResponseBody
    public Users saveAll(@RequestBody Users users){
        Users users1 = usersRepository.save(users);
        return users1;
    }




}

