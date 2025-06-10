package com.app.portaldeempleo.utils;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtils {

    // Genera un hash de la contraseña
    public static String hashPassword(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }

    // Verifica si la contraseña en texto plano coincide con el hash almacenado
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        if (hashedPassword == null || !hashedPassword.startsWith("$2a$")) {
            throw new IllegalArgumentException("Hash inválido para verificar");
        }
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}
