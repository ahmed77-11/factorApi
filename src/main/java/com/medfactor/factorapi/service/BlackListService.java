package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.BlackList;

import java.util.List;

public interface BlackListService {
    BlackList createBlackList(BlackList blackList);
    BlackList updateBlackList(Long Id,BlackList blackList);
    BlackList getBlackListById(Long id);
    List<BlackList> getAllBlackList();
    void deleteBlackList(Long id);
}
