package Security;


import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.*;

public class Security {

//    private static byte[] key = {
//        0x74, 0x68, 0x69, 0x73, 0x49, 0x73, 0x41, 0x53,
//        0x65, 0x63, 0x72, 0x65, 0x74, 0x4b, 0x65, 0x79
//    // thisisasecretkey
//    };
    
//    private static byte[] key = {'t', 'h', 'i', 's', 'i', 's', 'a', 's', 'e', 'c', 'r', 'e', 't', 'k', 'e', 'y'}

//    private static byte[] key = {'e', 'd', 'r', 'i', 'e', 'c', 'h', 'b', 'a', 'l', 'a', 'j', 'a', 'd', 'i', 'a'};
    
//    private static byte[] key = {'l','a','w','r','e','n','c','e',
//                                     'd', 'e', 'c', 'a', 'm', 'o', 'r', 'a'};

    public static String encrypt(String strToEncrypt, byte[] key, String cipherStr) {
        String encryptedString = null;
        try {
            Cipher cipher = Cipher.getInstance(cipherStr);
            final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            encryptedString = Base64.encodeBase64String(cipher.doFinal(strToEncrypt.getBytes()));
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return encryptedString;
    }

    public static String decrypt(String codeDecrypt, byte[] key, String cipherStr) {
        String decryptedString = null;
        try {
            Cipher cipher = Cipher.getInstance(cipherStr);
            final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            decryptedString = new String(cipher.doFinal(Base64.decodeBase64(codeDecrypt)));
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return decryptedString;
    }
}
