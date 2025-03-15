package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.TypePieceId;
import com.medfactor.factorapi.repos.TypePieceIdRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypePieceIdServiceImpl implements TypePieceIdService{
    @Autowired
    private TypePieceIdRepository repository;
    @Override
    public List<TypePieceId> getAllPieceId() {
        return repository.findAll();
    }

    @Override
    public TypePieceId addPieceId(TypePieceId pieceId) {
        return repository.save(pieceId);
    }


}
