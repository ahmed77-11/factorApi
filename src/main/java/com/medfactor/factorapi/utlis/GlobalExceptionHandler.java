package com.medfactor.factorapi.utlis;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<String> handleDataIntegrityViolation(DataIntegrityViolationException ex) {
        Throwable rootCause = getRootCause(ex);
        if (rootCause != null && rootCause.getMessage() != null) {
            String lowerMsg = rootCause.getMessage().toLowerCase();
            if (lowerMsg.contains("duplicate") || lowerMsg.contains("dupliquée") || lowerMsg.contains("contrainte unique")) {
                // Return a 409 Conflict status with a custom French message
                return ResponseEntity.status(HttpStatus.CONFLICT)
                        .body("Cette personne existe déjà.");
            }
        }
        // Fallback for any other cases
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("Une erreur interne est survenue.");
    }

    private Throwable getRootCause(Throwable throwable) {
        Throwable cause = throwable.getCause();
        if (cause != null && cause != throwable) {
            return getRootCause(cause);
        }
        return throwable;
    }
}
