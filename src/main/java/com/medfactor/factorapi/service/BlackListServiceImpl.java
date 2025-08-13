package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.BlackList;
import com.medfactor.factorapi.repos.BlackListRepositroy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlackListServiceImpl implements BlackListService{

    @Autowired
    private BlackListRepositroy blackListRepositroy;
    @Override
    public BlackList createBlackList(BlackList blackList) {

        if (blackList == null) {
            throw new IllegalArgumentException("BlackList ne peut pas être null");
        }

        return blackListRepositroy.save(blackList);
    }

    @Override
    public BlackList updateBlackList(Long Id, BlackList blackList) {
        if (Id == null || blackList == null) {
            throw new IllegalArgumentException("ID et blackList ne peuvent pas être nulls");
        }

        blackList.setId(Id);

        // Update other fields as necessary

        return blackListRepositroy.save(blackList);
    }

    @Override
    public BlackList getBlackListById(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("ID ne peut pas être null");
        }
        return blackListRepositroy.findByIdAndArchvier(id, false)
                .orElseThrow(() -> new IllegalArgumentException("BlackList avec Id" + id + " n'existe pas."));
    }

    @Override
    public List<BlackList> getAllBlackList() {
        return blackListRepositroy.findAllByArchvier(false);
    }

    @Override
    public void deleteBlackList(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("ID ne peut pas être null");
        }

        BlackList blackList = blackListRepositroy.findByIdAndArchvier(id, false)
                .orElseThrow(() -> new IllegalArgumentException("BlackList avec Id" + id + " n'existe pas."));

        blackList.setSysAction("DELETE");
        blackList.setArchvier(true); // Assuming archvier is a boolean field to mark as archived
        blackListRepositroy.save(blackList);
    }
}
