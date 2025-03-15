package com.medfactor.factorapi.service;

import com.medfactor.factorapi.entities.TypePieceId;

import java.util.List;

public interface TypePieceIdService {
    List<TypePieceId> getAllPieceId();
    TypePieceId addPieceId(TypePieceId pieceId);
}
