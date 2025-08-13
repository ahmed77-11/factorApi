package com.medfactor.factorapi.controllers;


import com.medfactor.factorapi.entities.BlackList;
import com.medfactor.factorapi.service.BlackListService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/blacklist")
public class BlackListController {
    @Autowired
    private BlackListService blackListService;

    @PostMapping("/add-to-blacklist")
    public ResponseEntity<BlackList> addToBlackList(@RequestBody BlackList blackList, HttpServletRequest http){
        Authentication auth= SecurityContextHolder.getContext().getAuthentication();
        blackList.setSysAdresseIp((String) http.getAttribute("clientIp"));
        blackList.setSysUser(auth.getName());
        blackList.setSysAction("CREATE");
        blackList.setSysUserId((Long) http.getAttribute("userId"));
        return ResponseEntity.ok(blackListService.createBlackList(blackList));
    }

    @GetMapping("/get-blacklist/{id}")
    public BlackList getBlackListById(@PathVariable("id") Long id) {
        return blackListService.getBlackListById(id);
    }

    @GetMapping("/get-blacklist")
    public List<BlackList> getAllBlackList() {
        return blackListService.getAllBlackList();
    }

    @PostMapping("/update-blacklist/{id}")
    public ResponseEntity<BlackList> updateBlackList(@PathVariable("id") Long id, @RequestBody BlackList blackList, HttpServletRequest http) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        blackList.setSysAdresseIp((String) http.getAttribute("clientIp"));
        blackList.setSysUser(auth.getName());
        blackList.setSysAction("UPDATE");
        blackList.setSysUserId((Long) http.getAttribute("userId"));
        return ResponseEntity.ok(blackListService.updateBlackList(id, blackList));
    }
    @DeleteMapping("/delete-blacklist/{id}")
    public ResponseEntity<Void> deleteBlackList(@PathVariable("id") Long id) {

        blackListService.deleteBlackList(id);
        return ResponseEntity.noContent().build();
    }

}
