package com.atom.application.handlers;

import java.io.IOException;
import java.util.Set;
import java.util.stream.Collectors;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class ValidationExceptionsHandlerTranslator extends ResponseEntityExceptionHandler {

    @ExceptionHandler(DataIntegrityViolationException.class)
    protected void handleDataIntegrityViolationException(DataIntegrityViolationException exc, ServletWebRequest request)
            throws IOException {
        String message = exc.getCause().toString();
        if (exc.getCause() instanceof org.hibernate.exception.ConstraintViolationException) {
            message = ((org.hibernate.exception.ConstraintViolationException) exc.getCause()).getSQLException().getMessage();
        }
        request.getResponse().sendError(HttpStatus.BAD_REQUEST.value(), message);
    }

    @ExceptionHandler(ConstraintViolationException.class)
    protected void handleConstraintViolation(ConstraintViolationException exc, ServletWebRequest request)
            throws IOException {
        Set<ConstraintViolation<?>> violations = exc.getConstraintViolations();
        String message = constraintViolationsToString(violations); 
        request.getResponse().sendError(HttpStatus.BAD_REQUEST.value(), message);
    }

    private String constraintViolationsToString(Set<ConstraintViolation<?>> violations) {
        return violations.stream().map(cv -> cv.getPropertyPath() + ": " + cv.getMessage())
                .collect(Collectors.joining(", "));
    }

}
